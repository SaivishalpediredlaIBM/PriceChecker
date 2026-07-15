# 🚀 Quick Start Guide - Price Comparison Chatbot

This guide will help you run the price comparison chatbot application in just a few minutes.

## Prerequisites

Before you begin, make sure you have:

1. **Java 21 or higher** installed
   - Check: `java -version`
   - Download from: https://adoptium.net/

2. **Maven 3.9+** installed
   - Check: `mvn -version`
   - Download from: https://maven.apache.org/download.cgi

3. **OpenAI API Key** (or IBM watsonx.ai credentials)
   - Get one from: https://platform.openai.com/api-keys

## Step-by-Step Instructions

### Step 1: Navigate to the Project Directory

Open your terminal/command prompt and navigate to the application directory:

**Windows (PowerShell):**
```powershell
cd price-comparison-chatbot\input-documents\price-chatbot-app
```

**Mac/Linux:**
```bash
cd price-comparison-chatbot/input-documents/price-chatbot-app
```

### Step 2: Set Your OpenAI API Key

**Windows (PowerShell):**
```powershell
$env:OPENAI_API_KEY="your-api-key-here"
```

**Mac/Linux:**
```bash
export OPENAI_API_KEY=your-api-key-here
```

**Alternative:** Edit `src/main/resources/application.properties` and replace `your-api-key-here` with your actual key:
```properties
quarkus.langchain4j.openai.api-key=sk-your-actual-key-here
```

### Step 3: Run the Application

**Option A: Using Maven Wrapper (Recommended)**

Windows:
```powershell
.\mvnw.cmd quarkus:dev
```

Mac/Linux:
```bash
./mvnw quarkus:dev
```

**Option B: Using Maven Directly**
```bash
mvn quarkus:dev
```

### Step 4: Wait for Startup

You'll see output like this:
```
__  ____  __  _____   ___  __ ____  ______ 
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/ 
 -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \   
--\___\_\____/_/ |_/_/|_/_/|_|\____/___/   
INFO  [io.quarkus] (Quarkus Main Thread) price-comparison-chatbot 1.0.0-SNAPSHOT on JVM started in 3.456s. Listening on: http://localhost:8080
```

The application is ready when you see: **"Listening on: http://localhost:8080"**

## Testing the Chatbot

### Method 1: Using curl (Command Line)

**Windows (PowerShell):**
```powershell
Invoke-RestMethod -Uri http://localhost:8080/api/chat -Method Post -ContentType "application/json" -Body '{"message": "What is the best price for iPhone 15 Pro?"}'
```

**Mac/Linux:**
```bash
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is the best price for iPhone 15 Pro?"}'
```

### Method 2: Using Quarkus Dev UI (Browser)

1. Open your browser
2. Go to: http://localhost:8080/q/dev
3. Explore the Dev UI features

### Method 3: Using a REST Client

If you have Postman, Insomnia, or similar:

- **URL:** `http://localhost:8080/api/chat`
- **Method:** POST
- **Headers:** `Content-Type: application/json`
- **Body:**
```json
{
  "message": "What is the best price for iPhone 15 Pro?"
}
```

## Example Queries to Try

Once the application is running, try these queries:

1. **Basic Price Query:**
   ```json
   {"message": "What's the price of MacBook Air M2?"}
   ```

2. **Best Price:**
   ```json
   {"message": "What's the best price for Sony WH-1000XM5?"}
   ```

3. **Brand-Specific:**
   ```json
   {"message": "Show me AirPods Pro 2 prices at Costco"}
   ```

4. **Availability Check:**
   ```json
   {"message": "Is Samsung Galaxy S24 available at Walmart?"}
   ```

5. **Browse Products:**
   ```json
   {"message": "What laptops do you have?"}
   ```

6. **Compare Products:**
   ```json
   {"message": "Compare prices for all headphones"}
   ```

## Expected Response Format

You should get a response like:

```json
{
  "response": "I found iPhone 15 Pro at 4 retailers:\n\n1. Apple Store - $999.00 (In Stock) ✅\n   Link: https://apple.com/iphone-15-pro\n\n2. Amazon - $999.99 (In Stock) ✅\n   Link: https://amazon.com/iphone-15-pro\n\n3. Best Buy - $1,049.99 (In Stock) ✅\n   Link: https://bestbuy.com/iphone-15-pro\n\n4. Walmart - $1,099.99 (Out of Stock) ❌\n   Link: https://walmart.com/iphone-15-pro\n\n💰 Best deal at Apple Store saves you $100.99 compared to the highest price!",
  "data": null
}
```

## Available API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/chat` | POST | Send message to chatbot |
| `/api/products` | GET | List all products |
| `/api/products/search?q={query}` | GET | Search products |
| `/api/products/category/{category}` | GET | Get products by category |
| `/api/health` | GET | Health check |

## Stopping the Application

Press `Ctrl+C` in the terminal where the application is running.

## Troubleshooting

### Problem: "mvn: command not found" or "mvnw: command not found"

**Solution:** Maven is not installed or not in your PATH.

**Fix:**
1. Download Maven from https://maven.apache.org/download.cgi
2. Add Maven's `bin` directory to your system PATH
3. Or use the Maven wrapper: `./mvnw` (Mac/Linux) or `.\mvnw.cmd` (Windows)

### Problem: "OPENAI_API_KEY not set"

**Solution:** The API key environment variable is not set.

**Fix:**
- Set it in your terminal (see Step 2 above)
- Or edit `application.properties` directly

### Problem: Port 8080 already in use

**Solution:** Another application is using port 8080.

**Fix:**
1. Stop the other application
2. Or change the port in `application.properties`:
   ```properties
   quarkus.http.port=8081
   ```

### Problem: "Failed to resolve dependencies"

**Solution:** Maven can't download dependencies.

**Fix:**
1. Check your internet connection
2. Try: `mvn clean install -U`
3. Delete `~/.m2/repository` and try again

### Problem: Compilation errors

**Solution:** Java version mismatch or missing dependencies.

**Fix:**
1. Ensure Java 21+ is installed: `java -version`
2. Clean and rebuild: `mvn clean compile`

## Next Steps

Once the application is running successfully:

1. **Explore the sample data** - Check what products are available
2. **Try different queries** - Test the AI's understanding
3. **Add new products** - Follow the guide in `prompt-templates/02-add-new-product.md`
4. **Customize the AI** - Modify the system message in `PriceComparisonAI.java`
5. **Deploy to production** - Use the Kubernetes manifests in `optional-generated-content/`

## Getting Help

- Check the main [README.md](README.md) for detailed documentation
- Review [example-queries.md](optional-generated-content/example-queries.md) for more query examples
- Use the prompt templates in `prompt-templates/` for common tasks

## Development Mode Features

When running in dev mode (`quarkus:dev`), you get:

- **Hot Reload** - Code changes are automatically detected
- **Dev UI** - Access at http://localhost:8080/q/dev
- **Continuous Testing** - Press `r` in the terminal to run tests
- **Database Console** - H2 console available in Dev UI

Enjoy using the Price Comparison Chatbot! 🎉