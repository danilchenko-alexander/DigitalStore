package com.DigitalStore.repos;

import com.DigitalStore.domain.ProductOrder;
import org.springframework.data.repository.CrudRepository;

public interface ProductOrderRepo extends CrudRepository<ProductOrder,Long>{
}
