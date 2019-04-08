package com.DigitalStore.repos;

import com.DigitalStore.domain.Users;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepo extends CrudRepository<Users, Long> {
}
