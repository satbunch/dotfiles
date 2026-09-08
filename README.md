# dotfiles

macOS開発環境用の個人dotfiles管理リポジトリ。

## 構成

各ツールの設定は `config/` 配下にツール名ごとのディレクトリで管理する。

| ディレクトリ | 内容 |
| --- | --- |
| `nvim` | Neovim設定（Lazy.nvimでプラグイン管理） |
| `tmux` | tmux設定（prefix: `Ctrl+q`） |
| `zsh` | Zsh設定（`.zshrc` / `.zshenv` / `.zprofile`。XDG非対応のためHOME直下に直接リンク） |
| `starship.toml` / `starship-kanagawa-wave.toml` | Starshipプロンプト設定 |
| `lazygit` | lazygitのカスタムコマンド等 |
| `ghostty` | Ghostty端末エミュレータ設定 |
| `alacritty` | Alacritty端末エミュレータ設定 |
| `karabiner` | Karabiner-Elementsのキーリマップ設定 |
| `git` | git ignore等の共通設定 |
| `github-copilot` | GitHub Copilot関連設定 |
| `neofetch` | neofetch設定 |
| `dconf` | GNOME(dconf)設定 |
| `powershell` | PowerShellプロファイル・プロンプト設定（Windows用） |
| `prompts` | プロンプトライブラリのデータ |

## セットアップ

`install.sh` が `config/` 配下の対象をシンボリックリンクとして `~/.config/` に配置する。

```bash
./install.sh
```

- `~/.config/` 配下へのリンク対象は `install.sh` 内の `LINKS` 配列で管理する。新しい設定を追加した場合はこの配列にも追記する
- zshはXDG非対応のため、`config/zsh/` 内の `.zshrc` / `.zshenv` / `.zprofile` は `HOME_LINKS` 配列でHOME直下（`~/.zshrc` 等）に直接リンクする
- リンク先に既存のファイル/ディレクトリがある場合は `~/.config.backup-<timestamp>/` へ退避してからリンクを作成する
- `DOTFILES_DIR` / `SRC_DIR` / `DEST_DIR` / `BACKUP_DIR` の各環境変数で配置元・配置先を上書きできる

現時点で `LINKS` / `HOME_LINKS` に含まれるのは `ghostty` / `karabiner` / `neofetch` / `nvim` / `tmux` / `starship.toml` / `starship-kanagawa-wave.toml` / zshの3ファイルのみ。`git` や `alacritty` 等はまだ `install.sh` によるリンク対象外のため、必要に応じて手動でリンクするか配列に追加する。

## その他

- Neovimのプラグイン管理: `:Lazy`（更新）、LSPサーバー管理: `:Mason`
- tmuxプラグイン管理: `prefix + I`（インストール）、`prefix + U`（更新）
