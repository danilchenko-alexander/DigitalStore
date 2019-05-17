package com.DigitalStore.repos;

import com.DigitalStore.domain.Items.Monitor;
import org.springframework.data.repository.CrudRepository;

public interface MonitorRepo extends CrudRepository<Monitor,Long> {
    Iterable<Monitor> findBySubcatalogId(Long id);
}
