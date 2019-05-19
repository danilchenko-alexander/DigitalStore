package com.DigitalStore.controller;


import com.DigitalStore.domain.Message;
import com.DigitalStore.domain.User;
import com.DigitalStore.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/Reviews")
public class ReviewsController {

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping
    public String showReviews(Model model){
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);
        return"reviews";
    }


    @PostMapping("delete")
    public String deleteMessage(@RequestParam("messageId") Message message, Model model){
        messageRepo.deleteById(message.getId());
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);
        return "redirect:/Reviews";
    }

    @PostMapping
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String msg, Map<String, Object> model){
        Message message = new Message(msg, user);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "reviews";
    }

}
