# Price Comparison System Guidelines

## Overview
This rule provides guidelines for developing and maintaining price comparison chatbot applications using Quarkus and LangChain4j.

## Core Principles

### 1. Price Display Standards
- **Always sort prices from lowest to highest** - Customers want to see the best deals first
- Include the following information for each price:
  - Brand/Retailer name
  - Price (with currency symbol)
  - Availability status (In Stock / Out of Stock)
  - Direct product link (when available)
  - Special notes (e.g., "Members only", "Limited stock")

### 2. Data Model Best Practices
- Use `BigDecimal` for price values to ensure precision
- Store timestamps for price updates to track freshness
- Maintain relationships between Products, Brands, and Prices
- Use appropriate indexes for search performance

### 3. AI Service Integration
- Use LangChain4j's `@RegisterAiService` for AI service interfaces
- Implement function calling with `@Tool` annotations
- Provide clear, descriptive tool names and descriptions
- Keep system messages focused and customer-friendly

### 4. Function Calling Tools
Essential tools for price comparison:
- `searchProducts` - Find products by name
- `comparePrices` - Get full price comparison
- `getBestPrice` - Get lowest price only
- `getPriceAtBrand` - Filter by specific brand
- `checkAvailability` - Check stock status
- `listAllProducts` - Browse available products
- `getProductsByCategory` - Filter by category

### 5. Response Formatting
- Use clear, conversational language
- Highlight savings opportunities
- Include emojis sparingly for emphasis (💰 for savings, ✅ for in stock)
- Provide actionable information (links, availability)
- Be transparent about limitations (out of stock, limited data)

### 6. Error Handling
- Gracefully handle missing products
- Suggest alternatives when exact matches aren't found
- Provide helpful error messages
- Never expose technical errors to end users

### 7. Performance Considerations
- Use eager fetching for price relationships
- Implement caching for frequently accessed data
- Optimize database queries with proper indexes
- Consider pagination for large result sets

### 8. Testing Strategy
- Test with various product name variations
- Verify price sorting accuracy
- Test availability filtering
- Validate link generation
- Test edge cases (no prices, all out of stock)

## Code Patterns

### Service Layer
```java
@ApplicationScoped
public class PriceComparisonService {
    // Business logic for price operations
    // Keep methods focused and single-purpose
    // Return sorted results by default
}
```

### AI Tools
```java
@ApplicationScoped
public class PriceComparisonTools {
    @Tool("Clear description of what this tool does")
    public String toolMethod(String parameter) {
        // Implementation
        // Return formatted, user-friendly strings
    }
}
```

### AI Service
```java
@RegisterAiService(tools = PriceComparisonTools.class)
public interface PriceComparisonAI {
    @SystemMessage("Clear instructions for the AI assistant")
    String chat(@UserMessage String userMessage);
}
```

## Configuration Standards

### LangChain4j Configuration
- Set appropriate temperature (0.7 for balanced responses)
- Configure reasonable token limits
- Enable request/response logging in development
- Use environment variables for API keys

### Database Configuration
- Use H2 for development/demo
- PostgreSQL for production
- Enable SQL logging in development
- Use proper connection pooling

## User Experience Guidelines

### Conversational Patterns
- Greet users warmly
- Ask clarifying questions when needed
- Provide context for recommendations
- Offer to help with related queries

### Information Hierarchy
1. Best price (most important)
2. All available prices (sorted)
3. Savings calculation
4. Additional product details
5. Related products or alternatives

### Proactive Assistance
- Suggest related products
- Mention special offers or deals
- Alert about limited stock
- Recommend based on category

## Security Considerations
- Validate all user inputs
- Sanitize product search queries
- Protect API keys and credentials
- Implement rate limiting for API endpoints
- Use HTTPS in production

## Extensibility Points
- Easy to add new brands/retailers
- Support for multiple currencies
- Price history tracking
- User preferences and saved searches
- Price drop alerts
- Integration with external price APIs

## Deployment Best Practices
- Use containerization (Docker)
- Deploy on Kubernetes for scalability
- Configure health checks
- Set up monitoring and logging
- Use environment-specific configurations
- Implement CI/CD pipelines

## MCP Integration
- Enable Quarkus MCP Server
- Expose relevant tools via MCP
- Document MCP capabilities
- Test MCP integration with IBM Bob

## Maintenance Guidelines
- Regularly update price data
- Monitor for stale prices
- Clean up old price records
- Update product information
- Review and optimize queries
- Keep dependencies updated