package com.DigitalStore.controller;


import com.DigitalStore.Service.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/contactUs")
public class EmailController {

    @Autowired
    private MailSender mailSender;

    @GetMapping
    public String contactUs(){

        return "contactUs";
    }

    @GetMapping("/send")
    public String sendqq(@RequestParam Map<String, String> form){
        String message = String.format("message from" +form.get("email")+ "\n" + form.get("message"));
        mailSender.send("gisujev@key-mail.net",form.get("subject"), message);
        return "contactUs";
    }
}
