package com.DigitalStore.repos;


import com.DigitalStore.domain.Items.Computer;
import org.springframework.data.repository.CrudRepository;

public interface ComputerRepo extends CrudRepository<Computer,Long> {
    Iterable<Computer> findBySubcatalogId(Long id);
}
