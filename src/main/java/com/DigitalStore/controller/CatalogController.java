package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Role;
import com.DigitalStore.domain.Subcatalog;
import com.DigitalStore.repos.SubcatalogRepo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/catalogList")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class CatalogController {

    @Autowired
    private SubcatalogRepo subcatalogRepo;

    @GetMapping
    public String main(Model model) {
        model.addAttribute("catalogs", Catalog.values());
        return "catalogList";
    }

    @GetMapping("{catalogs}")
    public String editCatalog(@PathVariable("catalogs") String catalogName, Model model){
        model.addAttribute("subcatalogs",subcatalogRepo.findByCatalogs(Catalog.valueOf(catalogName)));
        model.addAttribute("catalogName",catalogName);
        return "catalogEdit";
    }

    @PostMapping("/addSubcatalog")
    public String addSubcatalogToCatalog(Subcatalog subcatalogs,
                                         @RequestParam String catalogName,
                                         @RequestParam Map<String, String> form){
        Set<String> catalogs = Arrays.stream(Catalog.values())
                .map(Catalog::name)
                .collect(Collectors.toSet());

        for(String key : form.keySet()){
            if(catalogs.contains(key)){
                subcatalogs.getCatalogs().add(Catalog.valueOf(key));
            }
        }

        subcatalogs.setCatalogs(Collections.singleton(Catalog.valueOf(catalogName)));
        subcatalogRepo.save(subcatalogs);
        return "redirect:/catalogList";
    }
}
