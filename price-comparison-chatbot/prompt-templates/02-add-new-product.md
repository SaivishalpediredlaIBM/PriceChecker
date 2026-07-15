# Add New Products and Prices

**Mode:** Price Comparison Expert

**Context:**

This prompt helps you add new products and their prices across different brands to the database.

**Prompt:**

```
I want to add a new product to the price comparison system:

Product: [PRODUCT_NAME]
Category: [CATEGORY]
Description: [DESCRIPTION]
Specifications: [SPECS]

Prices:
- Amazon: $[PRICE] (In Stock/Out of Stock)
- Best Buy: $[PRICE] (In Stock/Out of Stock)
- Walmart: $[PRICE] (In Stock/Out of Stock)

Please:
1. Add the SQL INSERT statements to import.sql
2. Verify the data model supports this product
3. Test that the chatbot can find and compare prices for this product
```

**Example:**

```
I want to add a new product to the price comparison system:

Product: Nintendo Switch OLED
Category: Gaming Consoles
Description: Latest Nintendo Switch with vibrant OLED screen
Specifications: Display: 7" OLED, Storage: 64GB, Battery: 9 hours

Prices:
- Amazon: $349.99 (In Stock)
- Best Buy: $349.99 (In Stock)
- Walmart: $329.99 (In Stock)
- Costco: $319.99 (In Stock, Members only)

Please:
1. Add the SQL INSERT statements to import.sql
2. Verify the data model supports this product
3. Test that the chatbot can find and compare prices for this product
```

**Expected Result:**

- New product and price entries added to import.sql
- Database reloaded with new data
- Chatbot can successfully query the new product
- Price comparison works correctly

**Follow-up Actions:**

- Test various queries for the new product
- Verify sorting and availability filtering
- Add more products in the same category

---