package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "prices")
public class Price extends PanacheEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    public Product product;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brand_id", nullable = false)
    public Brand brand;

    @Column(nullable = false, precision = 10, scale = 2)
    public BigDecimal price;

    @Column(nullable = false, length = 3)
    public String currency = "USD";

    @Column(nullable = false)
    public Boolean inStock = true;

    @Column
    public LocalDateTime lastUpdated;

    @Column(length = 500)
    public String url;

    @Column(length = 500)
    public String notes;

    public Price() {
        this.lastUpdated = LocalDateTime.now();
    }

    public Price(Product product, Brand brand, BigDecimal price, Boolean inStock, String url) {
        this.product = product;
        this.brand = brand;
        this.price = price;
        this.inStock = inStock;
        this.url = url;
        this.lastUpdated = LocalDateTime.now();
    }

    @PrePersist
    @PreUpdate
    public void updateTimestamp() {
        this.lastUpdated = LocalDateTime.now();
    }

    // Custom finder methods
    public static java.util.List<Price> findByProduct(Product product) {
        return list("product = ?1 ORDER BY price ASC", product);
    }

    public static java.util.List<Price> findByProductAndBrand(Product product, Brand brand) {
        return list("product = ?1 AND brand = ?2", product, brand);
    }

    public static java.util.List<Price> findInStockByProduct(Product product) {
        return list("product = ?1 AND inStock = true ORDER BY price ASC", product);
    }

    public static Price findLowestPriceForProduct(Product product) {
        return find("product = ?1 AND inStock = true ORDER BY price ASC", product).firstResult();
    }
}
