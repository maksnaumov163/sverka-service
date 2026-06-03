FROM python:3.11-slim

WORKDIR /app

# Многопоточность для PyTorch и tokenizers
ENV OMP_NUM_THREADS=4
ENV MKL_NUM_THREADS=4
ENV TOKENIZERS_PARALLELISM=false

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Скачиваем модель во время сборки образа — один раз навсегда
RUN python3 -c "from sentence_transformers import SentenceTransformer; SentenceTransformer('paraphrase-multilingual-MiniLM-L12-v2')"

COPY . .

CMD ["python", "backend/main.py"]
