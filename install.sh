#!/usr/bin/env bash
# evren kurulum betiği — Fatih Muhammet Bahçıvan
# Kullanım:  curl -fsSL https://raw.githubusercontent.com/leykohos/evren/main/install.sh | bash
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/leykohos/evren/main"
BIN_DIR="${EVREN_BIN_DIR:-$HOME/.local/bin}"
HEDEF="$BIN_DIR/evren"

echo "evren kuruluyor…"

# Gereksinim kontrolü
eksik=0
command -v curl    >/dev/null 2>&1 || { echo "  ✗ curl bulunamadı";    eksik=1; }
command -v python3 >/dev/null 2>&1 || { echo "  ✗ python3 bulunamadı"; eksik=1; }
if ! command -v claude >/dev/null 2>&1; then
  echo "  ⚠ 'claude' (Claude Code) bulunamadı — evren çalışmak için ona ihtiyaç duyar."
  echo "    Kur: https://claude.com/claude-code"
fi
[ "$eksik" = 1 ] && { echo "Eksik araçları kurup tekrar deneyin."; exit 1; }

# Script'i indir
mkdir -p "$BIN_DIR"
if ! curl -fsSL "$REPO_RAW/evren" -o "$HEDEF"; then
  echo "  ✗ evren indirilemedi ($REPO_RAW/evren)"; exit 1
fi
chmod +x "$HEDEF"
echo "  ✓ $HEDEF"

# PATH kontrolü
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *)
    echo "  ⚠ $BIN_DIR PATH'inde değil — kabuk ayarına ekleniyor."
    satir="export PATH=\"$BIN_DIR:\$PATH\""
    for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
      [ -f "$rc" ] || continue
      grep -qF "$satir" "$rc" 2>/dev/null || printf '\n# evren\n%s\n' "$satir" >> "$rc"
    done
    echo "    Yeni bir terminal aç ya da:  export PATH=\"$BIN_DIR:\$PATH\""
    ;;
esac

echo
echo "Kuruldu. Başlamak için:  evren"
