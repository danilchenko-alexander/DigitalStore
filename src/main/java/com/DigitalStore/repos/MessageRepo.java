package com.DigitalStore.repos;

import com.DigitalStore.domain.Message;
import org.springframework.data.repository.CrudRepository;


public interface MessageRepo extends CrudRepository<Message, Long> {
    Iterable<Message> findById(Integer id);
    Iterable<Message> findByMsg(String str);
}
