package com.DigitalStore.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="subcatalogs")
public class Subcatalog {

    public String name;

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    @ElementCollection(targetClass = Catalog.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "category_type", joinColumns = @JoinColumn(name = "category_id"))
    @Enumerated(EnumType.STRING)
    private Set<Catalog> catalogs;

    public Subcatalog() {
    }

    public Subcatalog(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Catalog> getCatalogs() {
        return catalogs;
    }

    public void setCatalogs(Set<Catalog> catalog) {
        this.catalogs = catalog;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
