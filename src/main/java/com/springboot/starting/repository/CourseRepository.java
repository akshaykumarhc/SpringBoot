package com.springboot.starting.repository;

import com.springboot.starting.model.Course;
import org.springframework.data.repository.CrudRepository;

public interface CourseRepository extends CrudRepository<Course,String> {
    Iterable<Course> findByTopicId(String topicId);
}
