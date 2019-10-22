package com.springboot.starting.model;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class TopicService {
    private List<Topic> topics = new ArrayList<>(Arrays.asList(
            new Topic("001", "Java", "This course will give you basic !dea of Java."),
            new Topic("002", "Spring", "This course will give you basic !dea of Spring."),
            new Topic("003", "SQL", "This course will give you basic !dea of SQL."),
            new Topic("004", "Micro service", "This course will give you basic !dea of Micro service."),
            new Topic("005", "Mongo DB", "This course will give you basic !dea of Mongo DB.")
    ));

    public List<Topic> getTopics() {
        return topics;
    }

    public
    Topic getTopic(String id) {
        return topics.stream().filter(i->i.getId().equals(id)).findFirst().get();
    }

    public void addTopic(Topic topic) {
        topics.add(topic);
    }

    public void updateTopic(String id, Topic topic) {
        Topic temp = topics.stream().filter(i->i.getId().equals(id)).findFirst().get();
        temp.setDescription(topic.getDescription());
        temp.setName(topic.getName());
    }

    public void deleteTopic(String id) {
        topics.remove(topics.stream().filter(i->i.getId().equals(id)).findFirst().get());
    }
}
