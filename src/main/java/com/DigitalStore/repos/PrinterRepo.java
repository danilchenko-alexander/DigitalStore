package com.DigitalStore.repos;


import com.DigitalStore.domain.Items.Printer;
import org.springframework.data.repository.CrudRepository;

public interface PrinterRepo extends CrudRepository<Printer,Long> {
    Iterable<Printer> findBySubcatalogId(Long id);
}
