# morPHYtrek — The Voice Firewall

**Speak. It types. It talks back. Offline. Yours.**

morPHYtrek is a complete, portable, offline-first voice interface for Windows:

- 🎙️ **Dictation** — speak, and the words paste at your cursor. Like dictation.
- 🗣️ **Narration** — text files dropped in a folder are read aloud through Piper TTS, with a live RSVP (Rapid Serial Visual Presentation) word trace synced to the actual audio clock.
- 👁️ **RSVP subtitle cell** — one word at a time, ORP focus letter in rust, exactly matching the voice speed. Every word shows, including the last.
- 🚀 **Fully portable** — a single folder. Its own Python runtime, its own Piper voice, its own queue. Works from ANY folder on ANY Windows PC. Nothing installed. Nothing hardcoded.
- 🔌 **Chrome extension bridge** — right-click → Read Aloud → narrated through the same mouth.
- 🧠 **Whisper transcription** — automatic GPU detection. If you have an NVIDIA GPU and say yes, it downloads torch once and transcribes at full speed. Otherwise it runs clean on CPU.

## Quick start

1. Copy the `morPHYtrek_RELEASE` folder anywhere (USB stick, desktop, anywhere).
2. Run `morPHYtrek.bat`.
3. Speak into the mic — words land at your cursor.
4. Drop any `.txt` or `.json` file into `morphytrek_data\queue\` — it gets narrated, word by word, on the RSVP cell.

## The queue

One queue. Its own. `morphytrek_data\queue\` next to the app. Drop a text file or JSON like:

```json
{"text": "Hello world.", "source": "me", "engine": "piper"}
```

morPHYtrek picks it up, speaks it through Piper Alba, and shows every word in the RSVP cell in sync with the voice.

## Keyboard

- **Spacebar** — mute/unmute the microphone.

## What's inside

| Path | What it is |
|---|---|
| `morPHYtrek.bat` | Single launcher. Self-healing. Refreshes only its own bundle. |
| `morPHYtrek.py` | The engine: ear (Whisper) → mouth (Piper) → queue → RSVP → paste. |
| `runtime\` | Bundled Python 3.12 + all dependencies (106 packages). |
| `piper\` | Piper TTS voices (Alba default). |
| `morphytrek_extension\` | Chrome extension source for right-click Read Aloud. |
| `morphytrek_data\` | Created on first run: queue, config, logs, transcripts. |

## Get It

**$10 USD — one-time, yours forever.**

- 💳 **[Buy on Card — $10](https://buy.stripe.com/eVq3cnfLE24maMs4bw5wI02)** (Stripe checkout)
- 📧 e-Transfer (Canada): morphyesmastery@gmail.com

Free for anyone who needs it and cannot pay — email me, no questions asked.

## License

MIT — do whatever you want with it, keep the copyright, and please: give it to someone who needs a voice.

---

Built by Trent Brown — MorPHYes Mastery. **WE WORK HERE.**
