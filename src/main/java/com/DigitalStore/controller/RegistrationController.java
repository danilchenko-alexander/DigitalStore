package com.DigitalStore.controller;


import com.DigitalStore.domain.Role;
import com.DigitalStore.domain.User;
import com.DigitalStore.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User users, Map<String ,Object> model) {
        User userFromDb = userRepo.findByUsername(users.getUsername());

        if(userFromDb != null){
            model.put("message", "User exists");
            return "registration";
        }

        users.setActive(true);
        users.setRoles(Collections.singleton(Role.USER));
        userRepo.save(users);

        return "redirect:/MainPage";
    }
}
