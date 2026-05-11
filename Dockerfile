FROM python:3.11-slim

# Systemabhängigkeiten für Hugging Face + Streamlit
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Benutzer anlegen
RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:$PATH"

WORKDIR /app

# Requirements zuerst kopieren (für besseres Caching)
COPY --chown=user requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Rest der App kopieren
COPY --chown=user . /app

# Streamlit Config
RUN mkdir -p /app/.streamlit
COPY --chown=user .streamlit/config.toml /app/.streamlit/config.toml

EXPOSE 7860

# Wichtig: Streamlit auf Port 7860 starten (HF Docker erwartet das)
CMD ["streamlit", "run", "app.py", "--server.port=7860", "--server.address=0.0.0.0"]
