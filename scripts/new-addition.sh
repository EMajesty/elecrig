#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

prompt_nonempty() {
  local prompt=$1
  local value

  while true; do
    read -r -p "$prompt: " value
    if [[ -n ${value//[[:space:]]/} ]]; then
      REPLY=$value
      return
    fi
    printf 'Please enter a value.\n' >&2
  done
}

slugify() {
  local value=$1

  value=${value,,}
  value=${value//&/ and }
  value=$(printf '%s' "$value" | sed -E 's/[^[:alnum:]]+/-/g; s/^-+//; s/-+$//')
  [[ -n $value ]] || die "'$1' cannot be converted to a folder name"
  printf '%s' "$value"
}

documentation_name() {
  local value=$1

  if [[ $value == *[[:upper:]]* ]]; then
    printf '%s' "$value"
  else
    printf '%s%s' "${value:0:1}" "${value:1}" | sed -E 's/^([[:lower:]])/\U\1/'
  fi
}

select_option() {
  local prompt=$1
  shift
  local options=("$@")
  local choice index key

  if [[ -t 0 ]]; then
    choice=0
    printf '%s\n' "$prompt" >&2

    while true; do
      for index in "${!options[@]}"; do
        if ((index == choice)); then
          printf '\033[2K\r\033[1;36m> %s\033[0m\n' "${options[index]}" >&2
        else
          printf '\033[2K\r  %s\n' "${options[index]}" >&2
        fi
      done

      IFS= read -rsn1 key
      if [[ $key == $'\e' ]]; then
        IFS= read -rsn2 key
        case $key in
          '[A') choice=$(((choice - 1 + ${#options[@]}) % ${#options[@]})) ;;
          '[B') choice=$(((choice + 1) % ${#options[@]})) ;;
        esac
      elif [[ -z $key ]]; then
        REPLY=${options[choice]}
        return
      fi

      printf '\033[%dA' "${#options[@]}" >&2
    done
  fi

  while true; do
    printf '%s\n' "$prompt" >&2
    for index in "${!options[@]}"; do
      printf '  %d) %s\n' "$((index + 1))" "${options[index]}" >&2
    done
    read -r -p '> ' choice
    if [[ $choice =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#options[@]})); then
      REPLY=${options[choice - 1]}
      return
    fi
    printf 'Choose a number from 1 to %d.\n' "${#options[@]}" >&2
  done
}

list_child_directories() {
  local parent=$1
  local directory

  if [[ -d $parent ]]; then
    while IFS= read -r -d '' directory; do
      printf '%s\n' "${directory##*/}"
    done < <(find "$parent" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)
  fi
}

render_readme() {
  local template=$1
  local output=$2
  local manufacturer=$3
  local device=$4

  awk \
    -v manufacturer="$manufacturer" \
    -v device="$device" '
    function replace_literal(value, token, replacement, position) {
      while ((position = index(value, token)) != 0) {
        value = substr(value, 1, position - 1) replacement substr(value, position + length(token))
      }
      return value
    }
    {
      line = replace_literal($0, "{{MANUFACTURER}}", manufacturer)
      line = replace_literal(line, "{{DEVICE_NAME}}", device)
      print line
    }
  ' "$template" > "$output"
}

accessory_option='accessory (hinge, raiser, side panel...)'
adapter_option='adapter (pedal, synth, power supply...)'
select_option 'What are you adding?' "$accessory_option" "$adapter_option"
addition_type=$REPLY

if [[ $addition_type == "$accessory_option" ]]; then
  printf 'Accessory scaffolding is not implemented yet. No files were created.\n'
  exit 0
fi

mapfile -t adapter_categories < <(list_child_directories "$REPO_ROOT/adapters")
category_options=(new)
category_options+=("${adapter_categories[@]}")
select_option 'Select an adapter subfolder:' "${category_options[@]}"

if [[ $REPLY == new ]]; then
  prompt_nonempty 'New adapter subfolder name'
  category_slug=$(slugify "$REPLY")
else
  category_slug=$REPLY
fi

category_dir="$REPO_ROOT/adapters/$category_slug"
mapfile -t manufacturers < <(list_child_directories "$category_dir")
manufacturer_options=(new)
manufacturer_options+=("${manufacturers[@]}")
select_option 'Select a manufacturer:' "${manufacturer_options[@]}"

if [[ $REPLY == new ]]; then
  prompt_nonempty 'Manufacturer name'
  manufacturer_input=$REPLY
  manufacturer_slug=$(slugify "$manufacturer_input")
  manufacturer_name=$(documentation_name "$manufacturer_input")
else
  manufacturer_slug=$REPLY
  manufacturer_name=$(documentation_name "${manufacturer_slug//-/ }")
fi

prompt_nonempty 'Device name'
device_input=$REPLY
device_slug=$(slugify "$device_input")
device_name=$(documentation_name "$device_input")
adapter_dir="$category_dir/$manufacturer_slug/$device_slug"
readme_template="$REPO_ROOT/adapters/README-TEMPLATE.md"

[[ ! -e $adapter_dir ]] || die "adapter already exists: $adapter_dir"
[[ -f $readme_template ]] || die "README template not found: $readme_template"

mkdir -p "$adapter_dir/cad" "$adapter_dir/print" "$adapter_dir/images"
touch "$adapter_dir/cad/.gitkeep" "$adapter_dir/print/.gitkeep" "$adapter_dir/images/.gitkeep"
render_readme "$readme_template" "$adapter_dir/README.md" "$manufacturer_name" "$device_name"

printf 'Created %s\n' "${adapter_dir#"$REPO_ROOT/"}"
