package com.DigitalStore.controller;

import com.DigitalStore.domain.Message;
import com.DigitalStore.domain.Users;
import com.DigitalStore.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String main(@RequestParam(required = false) Integer filter, Model model){
        Iterable<Message> messages;

        if(filter != null && !filter.toString().isEmpty()){
            messageRepo.deleteById(filter.longValue());
        }

        messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "MainPage";
    }

    @PostMapping("/MainPage")
    public String add(
            @AuthenticationPrincipal Users user,
            @RequestParam String msg, Map<String, Object> model){
        Message message = new Message(msg, user);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "MainPage";
    }



}