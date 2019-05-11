package com.DigitalStore.controller;

import com.DigitalStore.domain.Product;
import com.DigitalStore.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    private ProductRepo productRepo;


    /*
        @GetMapping
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

        @GetMapping("/findMsg")
        public String delMs(@RequestParam(required = false) String filter, Model model){
            Iterable<Message> messages;

            if(!filter.isEmpty() && filter!=null){
                messages = messageRepo.findByMsg(filter);
            }
            else {
                messages = messageRepo.findAll();
            }

            model.addAttribute("messages", messages);
            model.addAttribute("filter", filter);
            return "MainPage";
        }



        @PostMapping
        public String add(
                @AuthenticationPrincipal User user,
                @RequestParam String msg, Map<String, Object> model){
            Message message = new Message(msg, user);
            messageRepo.save(message);
            Iterable<Message> messages = messageRepo.findAll();
            model.put("messages", messages);
            return "MainPage";
        }
    */
    @GetMapping
    public String main(Model model) {
        Iterable<Product> products;
        products = productRepo.findAll();
        model.addAttribute("products", products);
        return "MainPage";
    }

}