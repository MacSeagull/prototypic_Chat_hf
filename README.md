---
title: Prototypischer GP ChatBot
emoji: 🩺
colorFrom: blue
colorTo: indigo
sdk: docker
app_port: 7860
---

# Prototypischer ChatBot für praktische Ärzte

Spezialisierter medizinischer ChatBot mit Priscus, FORTA, EBM und Gelber Liste.


Prototypischer spezialisierter ChatBot für praktische Ärzte mit KBV-Praxiswissen, KBV-Wirkstoff aktuell, Priscus-Liste, FORTA, EBM und Gelber Liste.

## Technik
- Streamlit
- Hybrid RAG (Vector + BM25)
- Llama-3.3-70B via Together.ai

## Start
Die App lädt beim ersten Start die Datenbank automatisch herunter (dauert einiges Sekunden).
