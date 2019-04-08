package com.DigitalStore;

import com.DigitalStore.domain.Users;
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
        Iterable<Users> messages = messageRepo.findAll();
        model.put("messagess", messages);
        return "MainPage";
    }

    @PostMapping("/MainPage")
    public String add(@RequestParam String username, @RequestParam String password, @RequestParam String role, Map<String, Object> model){
        Users user = new Users(username,password,role);
        messageRepo.save(user);
        Iterable<Users> messages = messageRepo.findAll();
        model.put("messagess", messages);
        return "MainPage";
    }


}