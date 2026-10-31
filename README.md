# evren

**EVREN LLM altyapısı üzerinde çalışan yapay zekâ ajanı.**

`evren` komutu, Claude Code'un arayüzünü EVREN'in Anthropic uyumlu ucuna
yönlendirir; tıpkı `claude` gibi açılır — aynı arayüz, araçlar, dosya
düzenleme — ama **beyni senin seçtiğin EVREN modeli** (`glm-5.3`,
`deepseek-v4.1-flash`, `mimo-v2.6-pro`…) olur.

> **Not:** Çalışırken Anthropic/Claude kotası **harcanmaz** — tüm istekler
> EVREN'e gider. EVREN modelleri belirli bir tarihe kadar ücretsizdir.

_Fatih Muhammet Bahçıvan tarafından hazırlanmıştır._

---

## Gereksinimler

- **Claude Code** kurulu olmalı (`claude` komutu PATH'te) — https://claude.com/claude-code
- **EVREN API anahtarı** — https://evren-llmapi.ssyz.org.tr/api-keys
- `curl` ve `python3` (macOS ve çoğu Linux'ta hazır gelir)

## Kurulum

Tek satır:

```bash
curl -fsSL https://raw.githubusercontent.com/leykohos/evren/main/install.sh | bash
```

Kurulum `evren` komutunu `~/.local/bin` içine koyar. (Gerekirse `~/.local/bin`'i
PATH'ine ekler — yeni bir terminal aç ya da `source ~/.zshrc`.)

## Kullanım

```bash
evren                 # karşılama + model menüsü + başla
evren glm-5.3         # menüyü atla, doğrudan o modelle
evren --list          # tüm modelleri listele
evren --anahtar       # API anahtarını değiştir
evren --help
```

İlk çalıştırmada EVREN API anahtarın sorulur, doğrulanır ve
`~/.config/evren/key` içine (yalnız sende, 600 izinle) kaydedilir. Kullanım
şartları kabul edilmemişse ekranda kabul etmen istenir.

## Ajan modelleri

Ajan olarak kullanılabilen sohbet modelleri menüde listelenir (ör. `glm-5.3`
amiral model, `deepseek-v4.1-flash` ajan/kod, `mimo-v2.6-pro` 1M bağlam,
`qwen3.8-flash-next` hızlı). OCR / TTS / embedding / karar modelleri ajan
değildir, yalnız doğrudan API ile kullanılır.

## Güvenlik

- Bu script **hiçbir sır içermez**; API anahtarın yalnız senin makinende,
  `~/.config/evren/key` dosyasında tutulur, hiçbir yere gönderilmez.
- `evren`'in ayarladığı ortam değişkenleri yalnız o komuta geçer; normal
  `claude` oturumların gerçek Anthropic hesabınla çalışmaya devam eder.

## Lisans

MIT — bkz. [LICENSE](LICENSE).
