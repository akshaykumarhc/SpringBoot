package com.springboot.starting.controller;

import com.springboot.starting.model.Topic;
import com.springboot.starting.model.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ApplicationRestController {

    @Autowired
    private TopicService topicService;

    @RequestMapping("/topics")
    public List<Topic> getTopics(){
        return topicService.getTopics();
    }
    @RequestMapping("/topics/{id}")
    public Topic getTopic(@PathVariable String id){
        return topicService.getTopic(id);
    }
}
