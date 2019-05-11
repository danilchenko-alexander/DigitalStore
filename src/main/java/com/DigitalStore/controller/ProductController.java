package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Product;
import com.DigitalStore.domain.Subcatalog;
import com.DigitalStore.repos.ProductRepo;
import com.DigitalStore.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/catalogList/{catalogName}")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class ProductController {
    @Autowired
    private ProductRepo productRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("edit/{subcatalogId}")
    public String main(@PathVariable Subcatalog subcatalogId, Model model){
        Iterable<Product> products;
        products = productRepo.findBySubcatalogId(subcatalogId.getId());
        model.addAttribute("subcatalog", subcatalogId);
        model.addAttribute("products",products);
        return "productList";
    }


    @GetMapping("{product}")
    public String productEditForm(@PathVariable Product product, Model model){
        model.addAttribute("product", product);
        model.addAttribute("catalogs", Catalog.values());
        return "productEdit";
    }

    @PostMapping("edit/{subcatalog}")
    public String addProduct(@PathVariable("subcatalog") Subcatalog subcatalog,
                             @RequestParam String name,
                             @RequestParam String price,
                             @RequestParam String description,
                             Map<String, Object> model,
                             @RequestParam("file") MultipartFile file) throws IOException {

        Product product = new Product(name, Double.parseDouble(price), description);
        product.setSubcatalog(subcatalog);
        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));

            product.setFilename(resultFilename);
        }

        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();
        model.put("products", products);
        return "redirect:/catalogList/{catalogName}/edit/"+subcatalog.getId().toString();
    }



}
