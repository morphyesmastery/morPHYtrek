# morPHYtrek — The Voice Firewall

**Speak → it types. Drop text → it talks back. All offline. One folder. No install.**

- 🎙️ **Dictation** — Whisper STT that pastes at your cursor (GPU if you got it, CPU if you don't)
- 🗣️ **Narration** — Piper TTS with live RSVP word-trace synced to the actual audio clock
- 👁️ **RSVP subtitle cell** — one word at a time, ORP focus letter in rust, exactly matching the voice speed. Every word shows, including the last.
- 📖 **Read Player** — the book icon opens a full document reader: drop any PDF, DOCX, EPUB, or TXT and speed-read it at up to 1500 wpm with gold search hits, or let it read aloud. Voice off by default — read speed and narration speed are different beasts.
- 📁 **Fully portable** — bundled Python 3.12 + deps. Runs from a USB stick. No admin. No registry.
- ✈️ **Truly offline** — the speech model and four voices ship inside the folder. No download on first run.
- 🔒 **Zero cloud** — your voice never leaves your machine
- 🧩 **Chrome extension** — right-click any text → narrated through the same mouth

**Built for accessibility first. Open source (MIT). Paid build ships the full portable bundle.**

## Quick start

**Download the portable build:** [morPHYtrek_portable_v1.0.zip](https://github.com/morphyesmastery/morPHYtrek/releases/download/v1.0.0/morPHYtrek_portable_v1.0.zip) — 2.3 GB, everything inside.

1. Extract the zip anywhere (USB stick, desktop, anywhere). Do not run it from inside the zip.
2. Open the `morPHYtrek` folder and run `morPHYtrek.bat`.
3. Speak into the mic — words land at your cursor.
4. Drop any `.txt` or `.json` file into `morphytrek_data\queue\` — it gets narrated, word by word, on the RSVP cell.
5. Click the book icon — the Read Player drawer opens. Drop any document in and read.

## Why this exists

Most voice tools require:
- an account
- an internet connection
- admin rights to install
- a subscription

morPHYtrek requires none of those. It is one folder. Copy it anywhere. Double-click. Done.

Your voice never leaves your machine. It works on locked-down corporate PCs, school computers, library machines — anything that runs Windows. No admin rights. No registry writes. No cloud dependency.

For someone who needs a voice and cannot install software, this is the difference between having one and not having one.

## The queue

One queue. Its own. `morphytrek_data\queue\` next to the app. Drop a text file or JSON like:

```json
{"text": "Hello world.", "source": "me", "engine": "piper"}
```

morPHYtrek picks it up, speaks it through Piper, and shows every word in the RSVP cell in sync with the voice.

## Keyboard

- **Spacebar** — mute/unmute the microphone.
- **Arrow keys (in the Read Player)** — speed up/down, prev/next sentence.

## What's inside

| Path | What it is |
|---|---|
| `morPHYtrek.bat` | Single launcher. Self-healing. Refreshes only its own bundle. |
| `morPHYtrek.py` | The engine: ear (Whisper) → mouth (Piper) → queue → RSVP → paste → Read Player. |
| `reader\` | Read Player v3 — PDF, DOCX, EPUB, TXT reader with RSVP speed reading and gold search. |
| `runtime\` | Bundled Python 3.12 + all dependencies (106 packages). |
| `piper\` | Piper TTS engine (standalone, no Python) + `en_US-ryan-high`. |
| `morphytrek_data\voices\` | Alba, Northern English Male, Jenny, Ryan. |
| `models\faster-whisper-large-v3-turbo\` | The ear, inside the folder. Loads offline, no Hugging Face download. |
| `morphytrek_extension\` | Chrome extension source for right-click Read Aloud. |
| `morphytrek_data\` | Created on first run: queue, config, logs, transcripts. |

## Get It

**$25 USD — one-time, yours forever.**

- 💳 **[Buy on Card — $25](https://buy.stripe.com/cNi3cndDwdN49Io4bw5wI0f)** (Stripe checkout)
- 📧 e-Transfer (Canada): morphyesmastery@gmail.com

Free for anyone who needs it and cannot pay — email me, no questions asked.

## License

MIT — do whatever you want with it, keep the copyright, and please: **give it to someone who needs a voice.**

---

Built by MorPHYes Mastery. **WE WORK HERE.**
