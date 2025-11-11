FROM python:3.11-slim

WORKDIR /app

# install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy all files (includes main.py at root)
COPY . /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# IMPORTANT: main.py is at project root
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
