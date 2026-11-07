#! /usr/bin/env bash

set -euo pipefail

genlist() {
  local list="$1"
  shift

  cat "$list.header" >"$list.tmp"
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
  mv "$list.tmp" "$list.txt"
}

cat domains.txt | sort -bdf | uniq | perl -pe 's/[ ]*(?:www\.)?([^ ]+)/\1/' >domains.sorted
mv domains.sorted domains.txt

genlist "begone" "$(cat domains.txt | xargs)"
genlist "huge" "$(
  curl --silent 'https://raw.githubusercontent.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist/refs/heads/main/noai_hosts.txt' |
    grep -F '0.0.0.0' |
    perl -pe 's/[^ ]+[ ]+(?:www\.)?([^ \n\r]+)/\1/' |
    xargs
)"
