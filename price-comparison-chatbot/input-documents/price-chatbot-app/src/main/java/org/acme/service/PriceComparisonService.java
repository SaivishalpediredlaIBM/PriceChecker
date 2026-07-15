package org.acme.service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;
import org.acme.model.Brand;
import org.acme.model.Price;
import org.acme.model.Product;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class PriceComparisonService {

    /**
     * Find products by name (partial match)
     */
    public List<Product> findProductsByName(String productName) {
        if (productName == null || productName.trim().isEmpty()) {
            return Product.listAll();
        }
        return Product.findByName(productName.trim());
    }

    /**
     * Find a product by exact name
     */
    public Product findProductByExactName(String productName) {
        return Product.findByExactName(productName);
    }

    /**
     * Get all prices for a specific product, sorted by price (lowest first)
     */
    public List<Price> getAllPricesForProduct(String productName) {
        Product product = findProductByExactName(productName);
        if (product == null) {
            return List.of();
        }
        return Price.findByProduct(product);
    }

    /**
     * Get only in-stock prices for a product
     */
    public List<Price> getInStockPricesForProduct(String productName) {
        Product product = findProductByExactName(productName);
        if (product == null) {
            return List.of();
        }
        return Price.findInStockByProduct(product);
    }

    /**
     * Get the best (lowest) price for a product
     */
    public Price getBestPriceForProduct(String productName) {
        Product product = findProductByExactName(productName);
        if (product == null) {
            return null;
        }
        return Price.findLowestPriceForProduct(product);
    }

    /**
     * Get prices for a product from a specific brand
     */
    public List<Price> getPricesByBrand(String productName, String brandName) {
        Product product = findProductByExactName(productName);
        Brand brand = Brand.findByName(brandName);
        
        if (product == null || brand == null) {
            return List.of();
        }
        
        return Price.findByProductAndBrand(product, brand);
    }

    /**
     * Get all available products
     */
    public List<Product> getAllProducts() {
        return Product.listAll();
    }

    /**
     * Get products by category
     */
    public List<Product> getProductsByCategory(String category) {
        return Product.findByCategory(category);
    }

    /**
     * Get all brands
     */
    public List<Brand> getAllBrands() {
        return Brand.findAllActive();
    }

    /**
     * Calculate savings compared to highest price
     */
    public BigDecimal calculateSavings(Price lowestPrice, List<Price> allPrices) {
        if (lowestPrice == null || allPrices == null || allPrices.isEmpty()) {
            return BigDecimal.ZERO;
        }
        
        BigDecimal highestPrice = allPrices.stream()
            .map(p -> p.price)
            .max(BigDecimal::compareTo)
            .orElse(BigDecimal.ZERO);
        
        return highestPrice.subtract(lowestPrice.price);
    }

    /**
     * Format price comparison result as a readable string
     */
    public String formatPriceComparison(String productName) {
        List<Price> prices = getInStockPricesForProduct(productName);
        
        if (prices.isEmpty()) {
            return "No prices found for product: " + productName;
        }
        
        StringBuilder result = new StringBuilder();
        result.append("Price comparison for ").append(productName).append(":\n\n");
        
        int rank = 1;
        for (Price price : prices) {
            result.append(rank++).append(". ")
                  .append(price.brand.name)
                  .append(" - $").append(price.price)
                  .append(" (").append(price.inStock ? "In Stock" : "Out of Stock").append(")\n");
            
            if (price.url != null && !price.url.isEmpty()) {
                result.append("   Link: ").append(price.url).append("\n");
            }
            result.append("\n");
        }
        
        // Add savings information
        if (prices.size() > 1) {
            BigDecimal savings = calculateSavings(prices.get(0), prices);
            if (savings.compareTo(BigDecimal.ZERO) > 0) {
                result.append("💰 Best deal saves you $").append(savings)
                      .append(" compared to the highest price!\n");
            }
        }
        
        return result.toString();
    }

    /**
     * Check if a product is available at a specific brand
     */
    public boolean isProductAvailableAtBrand(String productName, String brandName) {
        List<Price> prices = getPricesByBrand(productName, brandName);
        return prices.stream().anyMatch(p -> p.inStock);
    }

    /**
     * Get average price for a product
     */
    public BigDecimal getAveragePrice(String productName) {
        List<Price> prices = getInStockPricesForProduct(productName);
        
        if (prices.isEmpty()) {
            return BigDecimal.ZERO;
        }
        
        BigDecimal sum = prices.stream()
            .map(p -> p.price)
            .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        return sum.divide(BigDecimal.valueOf(prices.size()), 2, BigDecimal.ROUND_HALF_UP);
    }
}
