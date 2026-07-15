package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "brands")
public class Brand extends PanacheEntity {

    @Column(nullable = false, unique = true)
    public String name;

    @Column
    public String website;

    @Column
    public String apiEndpoint;

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    public List<Price> prices;

    public Brand() {
    }

    public Brand(String name, String website) {
        this.name = name;
        this.website = website;
    }

    public Brand(String name, String website, String apiEndpoint) {
        this.name = name;
        this.website = website;
        this.apiEndpoint = apiEndpoint;
    }

    // Custom finder methods
    public static Brand findByName(String name) {
        return find("LOWER(name) = LOWER(?1)", name).firstResult();
    }

    public static List<Brand> findAllActive() {
        return listAll();
    }
}
