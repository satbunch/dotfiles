#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
SRC_DIR="${SRC_DIR:-$DOTFILES_DIR/config}"
DEST_DIR="${DEST_DIR:-$HOME/.config}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/.config.backup-$(date +%Y%m%d-%H%M%S)}"

# ここに「~/.config に貼りたい」項目を追加/削除していく
LINKS=(
  "ghostty"
  "karabiner" # 左がリンク名、右がdotfiles側の実体名
  "neofetch"
  "nvim"
  "tmux"
  "starship.toml"
  "starship-kanagawa-wave.toml"
)

info() { printf "[info] %s\n" "$*"; }
warn() { printf "[warn] %s\n" "$*" >&2; }
die()  { printf "[error] %s\n" "$*" >&2; exit 1; }

[[ -d "$SRC_DIR" ]] || die "source dir not found: $SRC_DIR"
mkdir -p "$DEST_DIR"

backup_if_needed() {
  local target="$1"
  # すでに存在するが、シンボリックリンクではない / 別のリンク を退避する
  if [[ -e "$target" || -L "$target" ]]; then
    if [[ -L "$target" ]]; then
      # 同じリンク先なら何もしない
      return 0
    fi
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
    warn "moved existing '$target' -> '$BACKUP_DIR/'"
  fi
}

link_one() {
  local link_name="$1"
  local src_name="$2"
  local src="$SRC_DIR/$src_name"
  local dest="$DEST_DIR/$link_name"

  [[ -e "$src" ]] || die "missing source: $src"

  # 既存のリンク/ファイルがあれば退避（シンボリックリンクは上書きでOK）
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    backup_if_needed "$dest"
  fi

  # -s: symlink, -f: force, -n: treat dest as normal file if it's a symlink to dir
  ln -sfn "$src" "$dest"
  info "linked: $dest -> $src"
}

info "dotfiles: $DOTFILES_DIR"
info "source : $SRC_DIR"
info "dest   : $DEST_DIR"

for entry in "${LINKS[@]}"; do
  if [[ "$entry" == *:* ]]; then
    link_name="${entry%%:*}"
    src_name="${entry#*:}"
  else
    link_name="$entry"
    src_name="$entry"
  fi
  link_one "$link_name" "$src_name"
done

if [[ -n "${BACKUP_DIR:-}" && -d "${BACKUP_DIR:-/nope}" ]]; then
  warn "backup created: $BACKUP_DIR"
fi

info "done"
