package com.DigitalStore.repos;


import com.DigitalStore.domain.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepo extends CrudRepository<Product,Long>{
}
