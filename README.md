# Price Comparison Chatbot

An intelligent agentic chatbot application that helps customers find the best prices for products across different brands and retailers using IBM Bob, Quarkus, and LangChain4j.

**Date added:** [07/07/2026]  
**Duration:** 30 min  
**Mode(s) Used:** Custom *Price Comparison Expert* mode

## 🎯 Overview

This demo showcases how to build an AI-powered price comparison chatbot that:
- Compares product prices across multiple brands/retailers
- Provides natural language interaction using LangChain4j
- Sorts prices from lowest to highest automatically
- Checks product availability in real-time
- Calculates potential savings for customers
- Integrates seamlessly with IBM Bob via MCP

## 🏗️ Architecture

```
Customer Query → Chat API → LangChain4j AI Service → Function Calling Tools
                                                              ↓
                                                    Price Comparison Service
                                                              ↓
                                                    Database (Products, Brands, Prices)
```

### Key Components

1. **Data Model**: Product, Brand, and Price entities with JPA/Hibernate
2. **Service Layer**: PriceComparisonService with business logic
3. **AI Tools**: Function calling tools for LLM interaction
4. **AI Service**: LangChain4j interface for natural language processing
5. **REST API**: Endpoints for chat and product queries
6. **MCP Integration**: Quarkus MCP Server for IBM Bob

## 📋 Prerequisites

- Java 21 or higher
- Maven 3.9+
- OpenAI API key (or IBM watsonx.ai credentials)
- IBM Bob IDE (optional, for enhanced development)

## 🚀 Quick Start

### 1. Clone and Navigate

```bash
cd price-comparison-chatbot/input-documents/price-chatbot-app
```

### 2. Set Your API Key

```bash
# Option 1: Environment variable
export OPENAI_API_KEY=your-api-key-here

# Option 2: Edit application.properties
# Replace 'your-api-key-here' with your actual key
```

### 3. Run the Application

```bash
./mvnw quarkus:dev
```

The application will start on `http://localhost:8080`

### 4. Test the Chatbot

**Using curl:**
```bash
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is the best price for iPhone 15 Pro?"}'
```

**Using the browser:**
Navigate to `http://localhost:8080/q/dev` for the Quarkus Dev UI

## 💬 Example Interactions

### Basic Price Query
```
User: "What's the price of iPhone 15 Pro?"

Bot: "I found iPhone 15 Pro at 4 retailers:

1. Apple Store - $999.00 (In Stock) ✅
   Link: https://apple.com/iphone-15-pro

2. Amazon - $999.99 (In Stock) ✅
   Link: https://amazon.com/iphone-15-pro

3. Best Buy - $1,049.99 (In Stock) ✅
   Link: https://bestbuy.com/iphone-15-pro

4. Walmart - $1,099.99 (Out of Stock) ❌
   Link: https://walmart.com/iphone-15-pro

💰 Best deal at Apple Store saves you $100.99 compared to the highest price!"
```

### Brand-Specific Query
```
User: "Show me MacBook Air M2 prices at Costco"

Bot: "MacBook Air M2 at Costco:
Price: $1,099.99
Availability: In Stock ✅
Link: https://costco.com/macbook-air-m2
Note: Members only"
```

### Category Browse
```
User: "What headphones do you have?"

Bot: "I have 3 headphones available:

1. Sony WH-1000XM5 - Industry-leading noise canceling
2. AirPods Pro 2 - Apple wireless earbuds with ANC
3. Bose QuietComfort 45 - Premium wireless headphones

Would you like to see price comparisons for any of these?"
```

### Availability Check
```
User: "Is Samsung Galaxy S24 available at Walmart?"

Bot: "Samsung Galaxy S24 is IN STOCK at Walmart for $849.00 ✅"
```

## 📁 Project Structure

```
price-chatbot-app/
├── src/main/java/org/acme/
│   ├── model/              # JPA entities
│   │   ├── Product.java
│   │   ├── Brand.java
│   │   └── Price.java
│   ├── service/            # Business logic
│   │   └── PriceComparisonService.java
│   ├── ai/                 # AI integration
│   │   ├── PriceComparisonAI.java
│   │   └── PriceComparisonTools.java
│   └── resource/           # REST endpoints
│       └── ChatResource.java
├── src/main/resources/
│   ├── application.properties
│   └── import.sql          # Sample data
├── .bob/
│   ├── modes/
│   │   └── price-comparison-expert.json
│   ├── rules/
│   │   └── price-comparison-guidelines.md
│   └── mcp.json
└── pom.xml
```

## 🔧 Configuration

### LangChain4j Settings

Edit `application.properties`:

```properties
# OpenAI Configuration
quarkus.langchain4j.openai.api-key=${OPENAI_API_KEY}
quarkus.langchain4j.openai.chat-model.model-name=gpt-4o-mini
quarkus.langchain4j.openai.chat-model.temperature=0.7

# Alternative: IBM watsonx.ai
# quarkus.langchain4j.watsonx.api-key=${WATSONX_API_KEY}
# quarkus.langchain4j.watsonx.project-id=${WATSONX_PROJECT_ID}
```

### Database Configuration

**Development (H2 in-memory):**
```properties
quarkus.datasource.db-kind=h2
quarkus.datasource.jdbc.url=jdbc:h2:mem:pricedb
```

**Production (PostgreSQL):**
```properties
quarkus.datasource.db-kind=postgresql
quarkus.datasource.jdbc.url=${DATABASE_URL}
```

## 🛠️ Available API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/chat` | Send message to chatbot |
| GET | `/api/products` | List all products |
| GET | `/api/products/search?q={query}` | Search products |
| GET | `/api/products/category/{category}` | Get products by category |
| GET | `/api/health` | Health check |

## 🤖 Using with IBM Bob

### 1. Start the Application

```bash
./mvnw quarkus:dev
```

### 2. Open in IBM Bob

Open the `price-chatbot-app` directory in IBM Bob IDE

### 3. Select Custom Mode

Switch to **Price Comparison Expert** mode from the bottom-left dropdown

### 4. Verify MCP Connection

Check the MCP tab to ensure Bob is connected to the Quarkus MCP Server

### 5. Start Prompting

Use the prompt templates in the `prompt-templates/` directory

## 📝 Sample Data

The application comes pre-loaded with:

**Products:**
- 3 Smartphones (iPhone 15 Pro, Samsung Galaxy S24, Google Pixel 8 Pro)
- 3 Laptops (MacBook Air M2, Dell XPS 15, HP Spectre x360)
- 3 Headphones (Sony WH-1000XM5, AirPods Pro 2, Bose QC45)
- 1 Tablet (iPad Pro 12.9)

**Brands:**
- Amazon
- Best Buy
- Walmart
- Apple Store
- Costco

**Prices:** 3-5 price entries per product across different brands

## 🎨 Customization

### Adding New Products

Edit `src/main/resources/import.sql`:

```sql
INSERT INTO products (id, name, category, description, specifications) 
VALUES (11, 'Product Name', 'Category', 'Description', 'Specs');

INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) 
VALUES (36, 11, 1, 299.99, 'USD', true, CURRENT_TIMESTAMP, 'https://...');
```

### Adding New Brands

```sql
INSERT INTO brands (id, name, website) 
VALUES (6, 'Target', 'https://www.target.com');
```

### Customizing AI Behavior

Edit the `@SystemMessage` in `PriceComparisonAI.java` to change how the chatbot responds.

## 🧪 Testing

### Run Tests

```bash
./mvnw test
```

### Manual Testing

```bash
# Test chat endpoint
curl -X POST http://localhost:8080/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Compare prices for Sony WH-1000XM5"}'

# Test product search
curl http://localhost:8080/api/products/search?q=iPhone

# Test category filter
curl http://localhost:8080/api/products/category/Laptops
```

## 🚢 Deployment

### Docker

Build the container:
```bash
./mvnw package
docker build -f src/main/docker/Dockerfile.jvm -t price-chatbot .
docker run -p 8080:8080 -e OPENAI_API_KEY=your-key price-chatbot
```

### Kubernetes

See `optional-generated-content/deployment.yaml` for Kubernetes manifests.

## 🔍 Troubleshooting

### Issue: "API key not configured"
**Solution:** Set the `OPENAI_API_KEY` environment variable or update `application.properties`

### Issue: "No prices found"
**Solution:** Ensure the database is initialized with `import.sql` data

### Issue: "MCP Server not connecting"
**Solution:** Verify the application is running on port 8080 and MCP is enabled in `application.properties`

## 📚 Learn More

- [Quarkus Documentation](https://quarkus.io/guides/)
- [LangChain4j Quarkus Extension](https://docs.quarkiverse.io/quarkus-langchain4j/dev/)
- [IBM Bob Documentation](https://ibm.com/bob)
- [Quarkus MCP Server Guide](https://quarkus.io/guides/dev-mcp)

## 🤝 Contributing

Contributions are welcome! Please follow the IBM Bob demo contribution guidelines.

## 📄 License

See [LICENSE](../../LICENSE) file for details.

---

**Built with ❤️ using IBM Bob, Quarkus, and LangChain4j**