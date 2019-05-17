package com.DigitalStore.repos;

import com.DigitalStore.domain.Items.Phone;
import org.springframework.data.repository.CrudRepository;

public interface PhoneRepo extends CrudRepository<Phone,Long> {
    Iterable<Phone> findBySubcatalogId(Long id);
}
