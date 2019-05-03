package com.DigitalStore.repos;


import com.DigitalStore.domain.Products;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepo extends CrudRepository<Products,Long>{
}
