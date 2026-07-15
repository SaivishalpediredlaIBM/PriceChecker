package org.acme.ai;

import dev.langchain4j.agent.tool.Tool;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.acme.model.Brand;
import org.acme.model.Price;
import org.acme.model.Product;
import org.acme.service.PriceComparisonService;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Tools that the AI can use to interact with the price comparison system.
 * These methods are exposed to the LLM via function calling.
 */
@ApplicationScoped
public class PriceComparisonTools {

    @Inject
    PriceComparisonService priceService;

    @Tool("Search for products by name. Returns a list of matching products.")
    public String searchProducts(String productName) {
        List<Product> products = priceService.findProductsByName(productName);
        
        if (products.isEmpty()) {
            return "No products found matching: " + productName;
        }
        
        StringBuilder result = new StringBuilder("Found " + products.size() + " product(s):\n");
        for (Product product : products) {
            result.append("- ").append(product.name)
                  .append(" (").append(product.category).append(")\n");
        }
        
        return result.toString();
    }

    @Tool("Get detailed price comparison for a specific product across all brands. Returns prices sorted from lowest to highest.")
    public String comparePrices(String productName) {
        return priceService.formatPriceComparison(productName);
    }

    @Tool("Get the best (lowest) price for a specific product. Returns the brand and price of the cheapest option.")
    public String getBestPrice(String productName) {
        Price bestPrice = priceService.getBestPriceForProduct(productName);
        
        if (bestPrice == null) {
            return "No prices found for product: " + productName;
        }
        
        StringBuilder result = new StringBuilder();
        result.append("Best price for ").append(productName).append(":\n");
        result.append("Brand: ").append(bestPrice.brand.name).append("\n");
        result.append("Price: $").append(bestPrice.price).append("\n");
        result.append("Availability: ").append(bestPrice.inStock ? "In Stock" : "Out of Stock").append("\n");
        
        if (bestPrice.url != null && !bestPrice.url.isEmpty()) {
            result.append("Link: ").append(bestPrice.url).append("\n");
        }
        
        return result.toString();
    }

    @Tool("Get prices for a specific product from a particular brand only.")
    public String getPriceAtBrand(String productName, String brandName) {
        List<Price> prices = priceService.getPricesByBrand(productName, brandName);
        
        if (prices.isEmpty()) {
            return "No prices found for " + productName + " at " + brandName;
        }
        
        StringBuilder result = new StringBuilder();
        result.append(productName).append(" at ").append(brandName).append(":\n");
        
        for (Price price : prices) {
            result.append("Price: $").append(price.price).append("\n");
            result.append("Availability: ").append(price.inStock ? "In Stock" : "Out of Stock").append("\n");
            
            if (price.url != null && !price.url.isEmpty()) {
                result.append("Link: ").append(price.url).append("\n");
            }
        }
        
        return result.toString();
    }

    @Tool("Check if a product is available (in stock) at a specific brand.")
    public String checkAvailability(String productName, String brandName) {
        boolean available = priceService.isProductAvailableAtBrand(productName, brandName);
        
        if (available) {
            List<Price> prices = priceService.getPricesByBrand(productName, brandName);
            Price inStockPrice = prices.stream()
                .filter(p -> p.inStock)
                .findFirst()
                .orElse(null);
            
            if (inStockPrice != null) {
                return productName + " is IN STOCK at " + brandName + " for $" + inStockPrice.price;
            }
        }
        
        return productName + " is currently OUT OF STOCK at " + brandName;
    }

    @Tool("Get a list of all available products in the system.")
    public String listAllProducts() {
        List<Product> products = priceService.getAllProducts();
        
        if (products.isEmpty()) {
            return "No products available in the system.";
        }
        
        StringBuilder result = new StringBuilder("Available products (" + products.size() + "):\n\n");
        
        // Group by category
        products.stream()
            .collect(Collectors.groupingBy(p -> p.category))
            .forEach((category, categoryProducts) -> {
                result.append(category).append(":\n");
                categoryProducts.forEach(p -> 
                    result.append("  - ").append(p.name).append("\n")
                );
                result.append("\n");
            });
        
        return result.toString();
    }

    @Tool("Get all products in a specific category (e.g., Smartphones, Laptops, Headphones).")
    public String getProductsByCategory(String category) {
        List<Product> products = priceService.getProductsByCategory(category);
        
        if (products.isEmpty()) {
            return "No products found in category: " + category;
        }
        
        StringBuilder result = new StringBuilder("Products in " + category + ":\n");
        for (Product product : products) {
            result.append("- ").append(product.name).append("\n");
        }
        
        return result.toString();
    }

    @Tool("Get a list of all brands/retailers in the system.")
    public String listAllBrands() {
        List<Brand> brands = priceService.getAllBrands();
        
        if (brands.isEmpty()) {
            return "No brands available in the system.";
        }
        
        StringBuilder result = new StringBuilder("Available brands/retailers:\n");
        for (Brand brand : brands) {
            result.append("- ").append(brand.name);
            if (brand.website != null && !brand.website.isEmpty()) {
                result.append(" (").append(brand.website).append(")");
            }
            result.append("\n");
        }
        
        return result.toString();
    }

    @Tool("Calculate the average price for a product across all brands.")
    public String getAveragePrice(String productName) {
        BigDecimal avgPrice = priceService.getAveragePrice(productName);
        
        if (avgPrice.compareTo(BigDecimal.ZERO) == 0) {
            return "Unable to calculate average price for: " + productName;
        }
        
        return "Average price for " + productName + " is $" + avgPrice;
    }

    @Tool("Get detailed information about a specific product including description and specifications.")
    public String getProductDetails(String productName) {
        Product product = priceService.findProductByExactName(productName);
        
        if (product == null) {
            return "Product not found: " + productName;
        }
        
        StringBuilder result = new StringBuilder();
        result.append("Product: ").append(product.name).append("\n");
        result.append("Category: ").append(product.category).append("\n");
        
        if (product.description != null && !product.description.isEmpty()) {
            result.append("Description: ").append(product.description).append("\n");
        }
        
        if (product.specifications != null && !product.specifications.isEmpty()) {
            result.append("Specifications: ").append(product.specifications).append("\n");
        }
        
        return result.toString();
    }
}
