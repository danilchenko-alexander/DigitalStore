package com.DigitalStore.repos;


import com.DigitalStore.domain.Items.Monoblock;
import org.springframework.data.repository.CrudRepository;

public interface MonoblockRepo extends CrudRepository<Monoblock,Long> {
    Iterable<Monoblock> findBySubcatalogId(Long id);
}
