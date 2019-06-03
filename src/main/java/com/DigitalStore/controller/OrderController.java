package com.DigitalStore.controller;

import com.DigitalStore.domain.ProductOrder;
import com.DigitalStore.repos.ProductOrderRepo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.internal.LinkedTreeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private ProductOrderRepo productOrderRepo;

    @PostMapping("/deleteOrder")
    public String deleteOrder(@RequestParam("orderId") ProductOrder productOrder){
        productOrderRepo.delete(productOrder);
        return "redirect:/orders";
    }

    @PostMapping("/markAsUnread")
    public String markOrderUnread(@RequestParam("orderId") ProductOrder productOrder){
        productOrder.setReviewed(false);
        productOrderRepo.save(productOrder);
        return "redirect:/orders";
    }

    @PostMapping("/markAsRead")
    public String markOrderRead(@RequestParam("orderId") ProductOrder productOrder){
        productOrder.setReviewed(true);
        productOrderRepo.save(productOrder);
        return "redirect:/orders";
    }

    @GetMapping("/orders")
    public String showOrders(Model model){

        List<ProductOrder> orders = (List<ProductOrder>) productOrderRepo.findAll();
        Gson gson = new GsonBuilder().create();

        ArrayList< ArrayList<LinkedTreeMap<String, String>>> currentOrders = new ArrayList<>();
        for(int i = 0; i < orders.size(); i++) {
            Map jsonMap = gson.fromJson(orders.get(i).getProducts(), Map.class);
            ArrayList<LinkedTreeMap<String, String>> productsInOrder;
            productsInOrder= (ArrayList<LinkedTreeMap<String, String>>) jsonMap.get("products");
            currentOrders.add(productsInOrder);
        }
        model.addAttribute("products",currentOrders);
        model.addAttribute("contacts", orders);
        return "orderState";
    }

    @PostMapping("/sendOrder")
    public String sendOrder(@RequestParam Map<String, String> form, @RequestParam String jsonfieldd2){
        ProductOrder productOrder = new ProductOrder();
        Date date = new Date();

        productOrder.setName(form.get("name"));
        productOrder.setFam(form.get("fam"));
        productOrder.setCity(form.get("city"));
        productOrder.setAddress(form.get("address"));
        productOrder.setEm(form.get("email"));
        productOrder.setNumber(form.get("number"));
        productOrder.setProducts(jsonfieldd2);
        productOrder.setReviewed(false);
        productOrder.setDate(date);

        productOrderRepo.save(productOrder);

        return "redirect:/";
    }
}
