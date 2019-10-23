package com.springboot.starting.repository;

import com.springboot.starting.model.Topic;
import org.springframework.data.repository.CrudRepository;

public interface TopicRepository extends CrudRepository<Topic,String> {
}
