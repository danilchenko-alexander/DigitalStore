package com.DigitalStore.repos;


import com.DigitalStore.domain.Contacts;
import org.springframework.data.repository.CrudRepository;

public interface ContactsRepo extends CrudRepository<Contacts, Long> {

}
