package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
public class Product extends PanacheEntity {

    @Column(nullable = false)
    public String name;

    @Column(nullable = false)
    public String category;

    @Column(length = 1000)
    public String description;

    @Column(length = 2000)
    public String specifications;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    public List<Price> prices;

    public Product() {
    }

    public Product(String name, String category, String description, String specifications) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.specifications = specifications;
    }

    // Custom finder methods
    public static List<Product> findByName(String name) {
        return list("LOWER(name) LIKE LOWER(?1)", "%" + name + "%");
    }

    public static List<Product> findByCategory(String category) {
        return list("LOWER(category) = LOWER(?1)", category);
    }

    public static Product findByExactName(String name) {
        return find("LOWER(name) = LOWER(?1)", name).firstResult();
    }
}
