# Price Comparison Chatbot — Deployment Guide

## Prerequisites

| Tool | Minimum version | Required for |
|------|----------------|--------------|
| Java (JDK) | 21 | All modes |
| Maven / `mvnw` | 3.9 | All modes |
| Docker | 24 | Docker mode |
| Docker Compose | v2 | Docker mode |
| `kubectl` | 1.28 | Kubernetes mode |

---

## Option 1 — Local development (fastest)

> Uses H2 in-memory database. No Docker needed.

**Windows:**
```powershell
$env:OPENAI_API_KEY = "sk-..."
.\output\deploy\run-local.ps1
```

**Linux / macOS:**
```bash
export OPENAI_API_KEY="sk-..."
chmod +x output/deploy/run-local.sh
./output/deploy/run-local.sh
```

**Or run Maven directly:**
```bash
cd input-documents/price-chatbot-app
export OPENAI_API_KEY="sk-..."
./mvnw quarkus:dev
```

**App is live at:** `http://localhost:8080`

---

## Option 2 — Docker Compose (recommended for demos)

> Runs the chatbot + PostgreSQL in containers.

### Step 1 — Create your `.env` file
```bash
cd input-documents/price-chatbot-app
cp ../../output/deploy/.env.example .env
# Edit .env and set OPENAI_API_KEY
```

### Step 2 — Start everything

**Windows:**
```powershell
$env:OPENAI_API_KEY = "sk-..."
.\output\deploy\run-docker.ps1
```

**Linux / macOS:**
```bash
export OPENAI_API_KEY="sk-..."
chmod +x output/deploy/run-docker.sh
./output/deploy/run-docker.sh
```

### Useful Docker commands
```bash
# View live logs
docker compose logs -f price-chatbot

# Stop services
docker compose down

# Stop and remove database volume
docker compose down -v

# Restart just the app (after code change + rebuild)
docker compose up --build price-chatbot -d
```

---

## Option 3 — Kubernetes

> Uses the YAML in `optional-generated-content/kubernetes-deployment.yaml`.

### Step 1 — Build and push image
```bash
cd input-documents/price-chatbot-app
./mvnw package -DskipTests -Dquarkus.container-image.build=true
docker tag price-comparison-chatbot:latest <your-registry>/price-comparison-chatbot:latest
docker push <your-registry>/price-comparison-chatbot:latest
```

### Step 2 — Update the image reference
Edit `optional-generated-content/kubernetes-deployment.yaml` line 51:
```yaml
image: <your-registry>/price-comparison-chatbot:latest
```

### Step 3 — Set secrets
```bash
kubectl create secret generic price-chatbot-secrets \
  --from-literal=OPENAI_API_KEY=sk-... \
  --from-literal=DATABASE_URL=jdbc:postgresql://postgres:5432/pricedb \
  --from-literal=DATABASE_USERNAME=priceuser \
  --from-literal=DATABASE_PASSWORD=your-secure-password \
  -n price-comparison
```

### Step 4 — Deploy
```bash
kubectl apply -f optional-generated-content/kubernetes-deployment.yaml
kubectl rollout status deployment/price-chatbot -n price-comparison
```

---

## Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/chat` | POST | Main chatbot interface |
| `/api/products` | GET | List all products |
| `/api/products/search?q=iphone` | GET | Search products |
| `/api/products/category/Smartphones` | GET | Filter by category |
| `/api/health` | GET | Simple health ping |
| `/q/health` | GET | Full SmallRye health |
| `/q/health/live` | GET | Liveness probe |
| `/q/health/ready` | GET | Readiness probe |

---

## Test the chatbot

```bash
# Ask for best price
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is the best price for iPhone 15 Pro?"}'

# Compare all laptops
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Compare prices for MacBook Air M2"}'

# Check stock
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Is the Sony WH-1000XM5 in stock at Amazon?"}'
```

---

## Switching AI provider

To use **IBM watsonx.ai** instead of OpenAI, uncomment the watsonx block in
[`application.properties`](../input-documents/price-chatbot-app/src/main/resources/application.properties)
and set the environment variables:
```bash
export WATSONX_API_KEY="..."
export WATSONX_PROJECT_ID="..."
```
