package com.springboot.starting.controller;

import com.springboot.starting.model.Topic;
import com.springboot.starting.model.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(method = RequestMethod.POST,value = "/topics")
    public Topic addTopic(@RequestBody Topic topic){
        topicService.addTopic(topic);
        return topicService.getTopic(topic.getId());
    }
    @RequestMapping(method = RequestMethod.PUT,value = "/topics/{id}")
    public Topic updateTopic(@PathVariable String id , @RequestBody Topic topic){
        topicService.updateTopic(id,topic);
        return topicService.getTopic(topic.getId());
    }
    @RequestMapping(method = RequestMethod.DELETE,value = "/topics/{id}")
    public void deleteTopic(@PathVariable String id){
        topicService.deleteTopic(id);
    }
}
