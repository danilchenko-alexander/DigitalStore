package com.DigitalStore.repos;


import com.DigitalStore.domain.Items.Notebook;
import org.springframework.data.repository.CrudRepository;

public interface NotebookRepo extends CrudRepository<Notebook,Long> {
    Iterable<Notebook> findBySubcatalogId(Long id);
}
