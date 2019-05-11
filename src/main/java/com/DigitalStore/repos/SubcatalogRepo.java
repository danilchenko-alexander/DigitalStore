package com.DigitalStore.repos;


import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Subcatalog;
import org.springframework.data.repository.CrudRepository;

public interface SubcatalogRepo extends CrudRepository<Subcatalog,Long> {
    Iterable<Subcatalog> findByCatalogs(Catalog catalog);
}
