package com.DigitalStore.controller;


import com.DigitalStore.domain.Contacts;
import com.DigitalStore.repos.ContactsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/Contacts")
public class ContactsController {

    @Autowired
    private ContactsRepo contactsRepo;

    @GetMapping
    public String showContactsPage(Model model){
        Iterable<Contacts> contacts = contactsRepo.findAll();
        Contacts con = contacts.iterator().next();
        Iterable<String> s = Arrays.asList(con.getPhoneNumbers().split("/"));
        model.addAttribute("phoneNumbers",getIterable(con.getPhoneNumbers()));
        model.addAttribute("links", getIterable(con.getLinks()));
        model.addAttribute("timeWork",getIterable(con.getTimeWorking()));
        model.addAttribute("address",con.getAddress());
        model.addAttribute("contacts", con);
        return "contacts";
    }

    @PostMapping
    public String saveContacts(@RequestParam Map<String, String> form, Map<String, Object> model){
        Iterable<Contacts> contacts = contactsRepo.findAll();
        Contacts con = contacts.iterator().next();
        con.setLinks(form.get("links"));
        con.setTimeWorking(form.get("timeWork"));
        con.setPhoneNumbers(form.get("phoneNumbers"));
        con.setAddress(form.get("address"));

        model.put("phoneNumbers",getIterable(con.getPhoneNumbers()));
        model.put("links", getIterable(con.getLinks()));
        model.put("timeWork",getIterable(con.getTimeWorking()));
        model.put("address",con.getAddress());
        model.put("contacts", con);

        contactsRepo.save(con);

        return "contacts";
    }

    public Iterable<String> getIterable(String str){
        Iterable<String> r = Arrays.asList(str.split("/"));
        return r;
    }
}
