package com.DigitalStore.repos;


import com.DigitalStore.domain.Items.TheTablet;
import org.springframework.data.repository.CrudRepository;

public interface TheTabletRepo extends CrudRepository<TheTablet,Long> {
    Iterable<TheTablet> findBySubcatalogId(Long id);
}
