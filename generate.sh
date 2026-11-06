#! /usr/bin/env bash

set -euo pipefail

genlist() {
  local list="$1"
  shift

  # shellcheck disable=SC2068
  for domain in $@; do
    cat <<-EOF >>"$list.tmp"
      ||$domain^\$document
			duckduckgo.com##li[data-layout="organic"]:has(a[href*="$domain"])
			duckduckgo.com##.tile:has(a[href*="$domain"])
			google.*##.g:has(a[href*=$domain])
			yandex.*##.serp-item:has(a[href*="$domain"])
			yandex.*##li.serp-item:has(a[href*="$domain"])
		EOF
  done
  mv "$list.tmp" "$list"
}

cat domains.txt | sort -bdf | uniq >domains.sorted
mv domains.sorted domains.txt

genlist "begone.txt" "$(cat domains.txt | xargs)"
genlist "huge.txt" "$(
  curl --silent 'https://raw.githubusercontent.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist/refs/heads/main/noai_hosts.txt' |
    grep -F '0.0.0.0' |
    cut -d ' ' -f 2 |
    tr -d '\r' |
    xargs
)"
