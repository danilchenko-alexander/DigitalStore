package com.DigitalStore.controller;

import com.DigitalStore.domain.Message;
import com.DigitalStore.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(

            Map<String, Object> model
    ) {
        return "greeting";
    }

    @GetMapping("/MainPage")
    public String main(Map<String, Object> model){
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "MainPage";
    }

    @PostMapping("/MainPage")
    public String add(@RequestParam String msg, Map<String, Object> model){
        Message message = new Message(msg);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "MainPage";
    }


}