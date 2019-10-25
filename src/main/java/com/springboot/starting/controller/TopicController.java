package com.springboot.starting.controller;

import com.springboot.starting.model.Topic;
import com.springboot.starting.model.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @GetMapping("/topics")
    public List<Topic> getTopics(){
        return topicService.getTopics();
    }
    @GetMapping("/topics/{id}")
    public Topic getTopic(@PathVariable String id){
        return topicService.getTopic(id);
    }

    @PostMapping(value = "/topics")
    public Topic addTopic(@RequestBody Topic topic){
        topicService.addTopic(topic);
        return topicService.getTopic(topic.getId());
    }
    @PutMapping(value = "/topics/{id}")
    public Topic updateTopic(@PathVariable String id , @RequestBody Topic topic){
        topicService.updateTopic(topic);
        return topicService.getTopic(topic.getId());
    }
    @DeleteMapping(value = "/topics/{id}")
    public void deleteTopic(@PathVariable String id){
        topicService.deleteTopic(id);
    }
}
