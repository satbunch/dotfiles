#!/bin/bash
# tmux の confirm-before 相当: y で閉じる、それ以外はキャンセル
# 使い方: confirm-close.sh pane|tab
target="$1"
case "$target" in
  pane) id="$HERDR_ACTIVE_PANE_ID"; label="ペイン" ;;
  tab)  id="$HERDR_ACTIVE_TAB_ID";  label="タブ" ;;
  *) exit 1 ;;
esac

printf '%s を閉じますか? (y/n) ' "$label"
read -r -n 1 answer
[ "$answer" = "y" ] && "$HERDR_BIN_PATH" "$target" close "$id" >/dev/null
