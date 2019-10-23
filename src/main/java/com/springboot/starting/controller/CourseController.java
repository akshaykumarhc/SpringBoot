package com.springboot.starting.controller;

import com.springboot.starting.model.Course;
import com.springboot.starting.model.CourseService;
import com.springboot.starting.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/topics/{topicId}/courses")
    public List<Course> getCourses(@PathVariable String topicId){
        return courseService.getCourses(topicId);
    }
    @RequestMapping("/topics/{topicid}/courses/{id}")
    public Course getCourse(@PathVariable String id){
        return courseService.getCourse(id);
    }

    @RequestMapping(method = RequestMethod.POST,value = "/topics/{topicId}/courses")
    public Course addCourse(@RequestBody Course course,@PathVariable String topicId){
        course.setTopic(new Topic(topicId,"",""));
        courseService.addCourse(course);
        return courseService.getCourse(course.getId());
    }
    @RequestMapping(method = RequestMethod.PUT,value = "/topics/{topicId}/courses/{id}")
    public Course updateCourse(@PathVariable String id , @RequestBody Course course,@PathVariable String topicId){
        course.setTopic(new Topic(topicId,"",""));
        courseService.updateCourse(course);
        return courseService.getCourse(course.getId());
    }
    @RequestMapping(method = RequestMethod.DELETE,value = "/topics/{topicId}/courses/{id}")
    public void deleteCourse(@PathVariable String id){
        courseService.deleteCourse(id);
    }
}
