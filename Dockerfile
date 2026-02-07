cat > Dockerfile <<'EOF'
# Docker support for Account Service
FROM python:3.11-slim

WORKDIR /app

# Install dependencies first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the source
COPY . .

# The service in this project usually listens on 8080
ENV PORT=8080

EXPOSE 8080

# Start the service (Gunicorn is typically used in this lab)
CMD ["gunicorn", "--bind=0.0.0.0:8080", "service:app"]
EOF
