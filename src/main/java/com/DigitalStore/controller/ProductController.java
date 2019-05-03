package com.DigitalStore.controller;

import com.DigitalStore.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String productList(){
        return "productList";
    }
}
