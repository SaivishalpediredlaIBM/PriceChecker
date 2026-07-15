# Enhance AI Tools and Capabilities

**Mode:** Price Comparison Expert

**Context:**

This prompt helps you add new AI tools or enhance existing ones to provide better price comparison features.

**Prompt:**

```
I want to enhance the chatbot's capabilities by adding a new tool:

Tool Name: [TOOL_NAME]
Purpose: [WHAT_IT_DOES]
Parameters: [PARAMETERS]
Return Value: [WHAT_IT_RETURNS]

Please:
1. Add the new @Tool method to PriceComparisonTools.java
2. Implement the business logic in PriceComparisonService.java if needed
3. Update the system message in PriceComparisonAI.java to mention this capability
4. Test the new tool with sample queries
```

**Example 1: Price History Tool**

```
I want to enhance the chatbot's capabilities by adding a new tool:

Tool Name: getPriceHistory
Purpose: Show price changes over time for a product
Parameters: productName (String), days (int)
Return Value: Formatted string showing price history

Please:
1. Add the new @Tool method to PriceComparisonTools.java
2. Implement the business logic in PriceComparisonService.java if needed
3. Update the system message in PriceComparisonAI.java to mention this capability
4. Test the new tool with sample queries
```

**Example 2: Price Alert Tool**

```
I want to add a price alert feature that notifies users when a product drops below a certain price.

Please:
1. Create a new PriceAlert entity
2. Add methods to set and check price alerts
3. Create a @Tool for setting price alerts
4. Update the AI service to handle alert-related queries
```

**Expected Result:**

- New tool method added with proper @Tool annotation
- Business logic implemented and tested
- AI service can use the new tool effectively
- Documentation updated

**Follow-up Actions:**

- Test the new tool with various queries
- Add error handling for edge cases
- Update the README with new capabilities

---