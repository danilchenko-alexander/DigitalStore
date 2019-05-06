package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Product;
import com.DigitalStore.repos.ProductRepo;
import com.DigitalStore.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/product")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class ProductController {
    @Autowired
    private ProductRepo productRepo;


    @GetMapping
    public String main(Model model){
        Iterable<Product> products;
        products = productRepo.findAll();
        model.addAttribute("products",products);
        return "productList";
    }

    @GetMapping("{product}")
    public String productEditForm(@PathVariable Product product, Model model){
        model.addAttribute("product", product);
        model.addAttribute("catalogs", Catalog.values());
        return "productEdit";
    }

    @PostMapping
    public String addProduct(@RequestParam String name,
                             @RequestParam String price,
                             @RequestParam String description,
                             Map<String, Object> model){

        Product product = new Product(name, Double.parseDouble(price), description);
        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();
        model.put("products", products);
        return "productList";
    }


}
