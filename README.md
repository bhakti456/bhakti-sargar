# 🥋 PhishDojo — Adaptive Scam-Awareness Trainer

> **Hackathon Track:** Cybersecurity & Digital Safety  
> **Target Audience:** Families, seniors, parents, and everyday internet users  
> **Tech Stack:** 100% Pure Vanilla Web (Single Self-Contained `index.html` with Zero External Dependencies)

---

## 📌 Problem & Motivation

Most people—especially aging parents and grandparents—fall victim to digital scams, courier fraud, and fake KYC notices because they do not recognize the subtle psychological triggers and technical red flags.

Traditional cybersecurity training is boring, corporate, and abstract. **PhishDojo** turns scam-spotting into an engaging, adaptive martial arts training dojo. Users learn by doing: analyzing realistic phone and email messages, identifying suspicious phrases, learning the four psychological attack vectors, and building digital reflexes.

---

## ⚡ Core Features

### 1. 22 Realistic Fictional Scenarios (Zero Real Data)
- **SMS, WhatsApp, Email, and Job Portal Mockups**: Pixel-perfect simulation of modern smartphone messaging interfaces, complete with status bars, verified badges, unverified warnings, and spoofed headers.
- **Threat Vector Coverage**:
  - Fake KYC / Bank Freeze alerts (`VM-EXBANK`)
  - Courier Redelivery fee scams (`QuickCourier`)
  - "Mom, I broke my phone" family emergencies
  - Accidental UPI transfer / QR payment traps
  - Overnight electricity power cut threats
  - YouTube "Like & Earn" / Telegram task scams
  - MegaMart Lucky Draw SUV prizes
  - Income Tax Department refund approval phishing
  - "Digital Arrest" fake police video call intimidation
  - Remote Job Equipment advance fee traps
  - CEO gift card emergency spoofing
  - Guaranteed 500% AI crypto bot investments
  - Airline flight cancellation rebooking links
  - Streaming service suspended billing notices
  - Social media copyright deletion notices
  - Telecom SIM deactivation APK malware traps
- **6 Genuinely Safe Scenarios**: Critical control scenarios (real netbanking OTP, monthly bank statements, doorstep delivery PIN, official job interviews, electricity receipts, school notices) so users learn **calm discernment** rather than ungrounded paranoia.

### 2. Interactive Red Flag Spotter Mechanic
- Users don't just guess "Scam" or "Safe"—they can tap suspicious phrases directly on the screen to plant red flags (🚩).
- Upon submitting, the Dojo reveals all actual red flags in glowing red and awards bonus XP for precision.

### 3. The 4 Psychological Levers of Social Engineering
Every scam is analyzed through the four core human emotional levers:
- ⚡ **Urgency (जल्दबाजी)**: Artificial deadlines ("Within 2 hours!", "Tonight at 9:30 PM") designed to prevent rational thought.
- 🛡️ **Authority (अधिकार / सत्ता)**: Impersonation of police, tax departments, banks, or corporate CEOs.
- 😨 **Fear (डर / नुकसान)**: Threats of arrest warrants, account freezes, power cut-offs, or harmed children.
- 🎁 **Reward (लालच / इनाम)**: Lottery windfalls, $300/day effortless jobs, and double refund payments.

### 4. Adaptive Learning Engine
- Tracks error patterns by category (`kyc`, `courier`, `family`, `payment`, `job`, `lottery`, `utility`, `authority_spoof`, `safe`) and psychological trigger.
- Dynamically increases the frequency of harder, subtler scenarios in areas where the user showed vulnerability.

### 5. Scam of the Day (Daily Radar)
- Deterministic calendar-based daily featured scam.
- Breaks down the real-world modus operandi step-by-step and offers a defense rule with +50 Dojo XP.

### 6. Family Protection Mode
- Curated 5-scenario training packs designed for children to send to their parents:
  - **Elderly Shield Pack**: Focuses on phone emergencies, electricity cuts, bank block SMS, and courier links.
  - **UPI & Payment Traps**: Focuses on QR scanning, fake refund payments, and lottery cash.
  - **Job & Crypto Scams**: Focuses on work-from-home tasks, Telegram bots, and fake hiring.
- Generates a shareable URL hash (`#family=elders`), a 6-digit Family Code (`DOJO-82`), and a one-click WhatsApp share button.

### 7. Dual Language Toggle (English & हिन्दी)
- Instant one-click toggle (`🌐 हिन्दी / English`).
- 100% of the UI, scenario texts, red flags, explanations, and safety checklists are natively translated into natural Hindi (देवनागरी).

### 8. Final Safety Evaluation & 8-Point Personalized Checklist
- **Personal Safety Score (0-100)**: Evaluates accuracy and red-flag precision with letter grades (S, A, B, C).
- **Psychological Vector Resistance Chart**: Pure CSS/HTML visual breakdown across Urgency, Authority, Fear, Reward, and Safe Discernment.
- **Personalized 8-Point Safety Checklist**: Dynamically highlights rules matching the user's specific mistakes. Includes a "Print for Fridge" stylesheet (`window.print()`).
- **Belt Ranking System**: White Belt ➔ Scam Spotter ➔ Cyber Guardian ➔ Phish Sensei ➔ Family Protector.

### 9. Senior & Accessibility First
- **Elderly Font Scaling**: One-click toggles (`A+`, `A++`, `A+++`).
- **Text-to-Speech (TTS)**: Dedicated 🔊 "Listen" button on every message that speaks the scenario aloud in English or Hindi using the Web Speech API.
- **Web Audio Synthesizer**: Native harmonic chimes, buzzers, and fanfares synthesized in real time (zero audio files needed, fully offline).
- **Keyboard Shortcuts**: `1` for Scam, `2` for Safe, `Space`/`Enter` to Continue.
- **High Contrast & Light/Dark Theme Support**.

---

## 🚀 How to Run

1. **Double-click `index.html`** in any web browser (Chrome, Edge, Firefox, Safari).
2. No installation, server, `node_modules`, or internet connection required.
3. Automatically falls back to in-memory state if browser security restricts `localStorage` on local `file://` protocols.

---

## 🛡️ Hackathon Compliance & Privacy
- **100% Fictional Data**: All domains use RFC 2606 `.test` or `.local` domains (e.g. `examp1e-bank-verify.test`). All phone numbers and brand names are fictional.
- **Zero External Requests**: No CDNs, tracking pixels, or remote fonts. Completely self-contained and air-gapped safe.
