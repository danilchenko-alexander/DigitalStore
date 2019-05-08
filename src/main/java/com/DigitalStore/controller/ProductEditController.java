package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Product;
import com.DigitalStore.domain.User;
import com.DigitalStore.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/productEdit")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class ProductEditController {

    @Autowired
    ProductRepo productRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @PostMapping
    public String productEdit (@RequestParam String name,
                               @RequestParam String price,
                               @RequestParam String description,
                               @RequestParam Map<String, String> form,
                               @RequestParam("productId") Product product){

        product.setName(name);
        product.setPrice(Double.parseDouble(price));
        product.setDescription(description);
        Set<String> catalogs = Arrays.stream(Catalog.values())
                .map(Catalog::name)
                .collect(Collectors.toSet());

        product.getCatalogs().clear();

        for(String key : form.keySet()){
            if(catalogs.contains(key)){
                product.getCatalogs().add(Catalog.valueOf(key));
            }
        }

        productRepo.save(product);
        return "redirect:/product";
    }


    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("productId") Product product, Model model){
        System.out.println("zdarova");
        if(product.getFilename()!=null) {
            File file = new File(uploadPath + "/" + product.getFilename());
            file.delete();
        }
        productRepo.deleteById(product.getId());

        return "redirect:/product";
    }

}
