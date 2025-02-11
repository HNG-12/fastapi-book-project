# Description: Dockerfile for FastAPI application
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

COPY . /app
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["sh", "-c", "nginx & uvicorn main:app --host 0.0.0.0 --port 8000"]
