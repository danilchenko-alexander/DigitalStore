package com.DigitalStore.repos;


import com.DigitalStore.domain.Product;
import com.DigitalStore.domain.Subcatalog;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepo extends CrudRepository<Product,Long>{
    Iterable<Product> findBySubcatalogId(Long id);
}
