# Example Chatbot Queries and Responses

This document contains example interactions with the price comparison chatbot to demonstrate its capabilities.

## Basic Price Queries

### Query 1: Simple Product Price
**User:** "What's the price of iPhone 15 Pro?"

**Bot Response:**
```
I found iPhone 15 Pro at 4 retailers:

1. Apple Store - $999.00 (In Stock) ✅
   Link: https://apple.com/iphone-15-pro

2. Amazon - $999.99 (In Stock) ✅
   Link: https://amazon.com/iphone-15-pro

3. Best Buy - $1,049.99 (In Stock) ✅
   Link: https://bestbuy.com/iphone-15-pro

4. Walmart - $1,099.99 (Out of Stock) ❌
   Link: https://walmart.com/iphone-15-pro

💰 Best deal at Apple Store saves you $100.99 compared to the highest price!
```

### Query 2: Best Price Only
**User:** "What's the best price for MacBook Air M2?"

**Bot Response:**
```
Best price for MacBook Air M2:
Brand: Costco
Price: $1,099.99
Availability: In Stock ✅
Link: https://costco.com/macbook-air-m2
Note: Members only

This is $100 less than the Apple Store price!
```

## Brand-Specific Queries

### Query 3: Specific Brand
**User:** "Show me Sony WH-1000XM5 prices at Costco"

**Bot Response:**
```
Sony WH-1000XM5 at Costco:
Price: $329.99
Availability: In Stock ✅
Link: https://costco.com/sony-wh1000xm5

This is the best price available - $70 less than Best Buy!
```

### Query 4: Availability Check
**User:** "Is Samsung Galaxy S24 available at Walmart?"

**Bot Response:**
```
Samsung Galaxy S24 is IN STOCK at Walmart for $849.00 ✅

This is actually the best price available! Amazon has it for $849.99.
```

## Category Browsing

### Query 5: List Products by Category
**User:** "What laptops do you have?"

**Bot Response:**
```
I have 3 laptops available:

1. MacBook Air M2 - Thin and light laptop with Apple M2 chip
   Best price: $1,099.99 at Costco

2. Dell XPS 15 - Premium Windows laptop for professionals
   Best price: $1,799.00 at Walmart

3. HP Spectre x360 - Convertible 2-in-1 laptop with touchscreen
   Best price: $1,449.00 at Walmart

Would you like detailed price comparisons for any of these?
```

### Query 6: All Products
**User:** "What products can you help me with?"

**Bot Response:**
```
I can help you compare prices for these products:

Smartphones:
  - iPhone 15 Pro
  - Samsung Galaxy S24
  - Google Pixel 8 Pro

Laptops:
  - MacBook Air M2
  - Dell XPS 15
  - HP Spectre x360

Headphones:
  - Sony WH-1000XM5
  - AirPods Pro 2
  - Bose QuietComfort 45

Tablets:
  - iPad Pro 12.9

Just ask me about any product and I'll show you the best prices!
```

## Comparison Queries

### Query 7: Compare Multiple Products
**User:** "Compare prices for AirPods Pro 2 and Sony WH-1000XM5"

**Bot Response:**
```
Here's a comparison:

AirPods Pro 2:
Best price: $229.99 at Costco ✅
Other prices: $249.00-$249.99 at Amazon, Best Buy, Apple Store

Sony WH-1000XM5:
Best price: $329.99 at Costco ✅
Other prices: $349.99-$399.99 at Amazon, Best Buy, Walmart

Both products are available at Costco with the best prices!
```

### Query 8: Average Price
**User:** "What's the average price for Dell XPS 15?"

**Bot Response:**
```
Average price for Dell XPS 15 is $1,816.66

Price range:
- Lowest: $1,799.00 at Walmart
- Highest: $1,849.99 at Best Buy
- Difference: $50.99

I recommend buying from Walmart to get the best deal!
```

## Advanced Queries

### Query 9: Product Details
**User:** "Tell me about the Google Pixel 8 Pro"

**Bot Response:**
```
Product: Google Pixel 8 Pro
Category: Smartphones
Description: Google flagship with advanced AI photography
Specifications: Display: 6.7" OLED, Storage: 128GB, Camera: 50MP, Tensor G3 chip

Current prices:
1. Walmart - $899.00 (Out of Stock) ❌
2. Amazon - $899.99 (In Stock) ✅
3. Best Buy - $949.99 (In Stock) ✅

Best available price: $899.99 at Amazon
```

### Query 10: Out of Stock Handling
**User:** "Where can I buy HP Spectre x360?"

**Bot Response:**
```
HP Spectre x360 is available at:

1. Amazon - $1,449.99 (In Stock) ✅
   Link: https://amazon.com/hp-spectre-x360

2. Best Buy - $1,499.99 (In Stock) ✅
   Link: https://bestbuy.com/hp-spectre-x360

Note: Walmart is currently out of stock.

Best deal: Amazon at $1,449.99 (saves you $50!)
```

## Conversational Queries

### Query 11: Natural Language
**User:** "I'm looking for good headphones under $300"

**Bot Response:**
```
Great! I have some excellent options under $300:

1. AirPods Pro 2 - $229.99 at Costco ✅
   - In-ear, Active Noise Canceling, Spatial Audio
   - Best for: Apple ecosystem users

2. Bose QuietComfort 45 - $279.99 at Amazon ✅
   - Over-ear, Excellent comfort, 24-hour battery
   - Best for: Long listening sessions

Both are well under your $300 budget. The Sony WH-1000XM5 is also available but starts at $329.99.

Would you like more details about any of these?
```

### Query 12: Follow-up Question
**User:** "Which one has the best noise canceling?"

**Bot Response:**
```
For the best noise canceling, I'd recommend the Sony WH-1000XM5 at $329.99 (Costco).

While it's slightly over your $300 budget, it has industry-leading noise cancellation. However, if you want to stay under $300, the Bose QuietComfort 45 at $279.99 also has excellent noise canceling and is known for superior comfort.

Both are great choices - Sony for absolute best ANC, Bose for best value under $300!
```

## Error Handling

### Query 13: Product Not Found
**User:** "What's the price of PlayStation 5?"

**Bot Response:**
```
I don't have pricing information for PlayStation 5 in my database yet.

However, I can help you with these gaming-related products:
- Nintendo Switch OLED (if added)
- Gaming laptops like Dell XPS 15

Would you like information about any of these instead?
```

### Query 14: Ambiguous Query
**User:** "Show me Apple products"

**Bot Response:**
```
I have several Apple products available:

1. iPhone 15 Pro - Starting at $999.00
2. MacBook Air M2 - Starting at $1,099.99
3. AirPods Pro 2 - Starting at $229.99
4. iPad Pro 12.9 - Starting at $1,049.99

Which one would you like to know more about?
```

## Tips for Best Results

1. **Be specific**: "iPhone 15 Pro price" works better than just "iPhone"
2. **Ask for comparisons**: "Compare prices for [product]" gives you all options
3. **Specify brands**: "Show me [product] at Amazon" for targeted results
4. **Check availability**: "Is [product] in stock at [brand]?" for quick checks
5. **Browse categories**: "What laptops do you have?" to explore options