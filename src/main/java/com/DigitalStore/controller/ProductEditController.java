package com.DigitalStore.controller;

import com.DigitalStore.domain.Items.Computer;
import com.DigitalStore.domain.Items.Phone;
import com.DigitalStore.repos.*;
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
@RequestMapping("/productEdit")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class ProductEditController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private ComputerRepo computerRepo;

    @Autowired
    private MonitorRepo monitorRepo;

    @Autowired
    private MonoblockRepo monoblockRepo;

    @Autowired
    private NotebookRepo notebookRepo;

    @Autowired
    private PhoneRepo phoneRepo;

    @Autowired
    private PrinterRepo printerRepo;

    @Autowired
    private TheTabletRepo theTabletRepo;

    /*@Value("${upload.path}")
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
        *//*Set<String> catalogs = Arrays.stream(Catalog.values())
                .map(Catalog::name)
                .collect(Collectors.toSet());

        product.getCatalogs().clear();

        for(String key : form.keySet()){
            if(catalogs.contains(key)){
                product.getCatalogs().add(Catalog.valueOf(key));
            }
        }*//*

        productRepo.save(product);
        return "redirect:/product";
    }*/

    @PostMapping("/saveComputer")
    public String saveComputer(@RequestParam Map<String, String> form,
                               @RequestParam("productId") Computer computer,
                               @RequestParam("file") MultipartFile file) throws IOException {
        computer.setName(form.get("name"));
        if (!form.get("price").isEmpty())
            computer.setPrice(Double.parseDouble(form.get("price")));
        computer.setDescription(form.get("description"));
        if (!form.get("numCPU").isEmpty())
            computer.setNumCPU(Integer.parseInt(form.get("numCPU")));
        computer.setNameCPU(form.get("nameCPU"));
        if (!form.get("numOfCores").isEmpty())
            computer.setNumOfCores(Integer.parseInt(form.get("numOfCores")));
        if (!form.get("frequency").isEmpty())
            computer.setFrequency(Integer.parseInt(form.get("frequency")));
        if (!form.get("sharedCache").isEmpty())
            computer.setSharedCache(Integer.parseInt(form.get("sharedCache")));
        computer.setChipset(form.get("chipset"));
        computer.setNumOfSlots(form.get("numOfSlots"));
        if (!form.get("maxMemorySize").isEmpty())
            computer.setMaxMemorySize(Integer.parseInt(form.get("maxMemorySize")));
        if (!form.get("memorySize").isEmpty())
            computer.setMemorySize(Integer.parseInt(form.get("memorySize")));
        computer.setTypeRAM(form.get("typeRAM"));
        if (!form.get("frequencyRAM").isEmpty())
            computer.setFrequencyRAM(Integer.parseInt(form.get("frequencyRAM")));
        computer.setGraphicAdapter(form.get("graphicAdapter"));
        computer.setTypeOfGraphicAdapter(form.get("typeOfGraphicAdapter"));
        if (!form.get("storageCapacity").isEmpty())
            computer.setStorageCapacity(Integer.parseInt(form.get("storageCapacity")));
        computer.setMemoryCards(form.get("memoryCards"));
        computer.setConfigCapacity(form.get("configCapacity"));
        if (!form.get("rotationalSpeed").isEmpty())
            computer.setRotationalSpeed(Integer.parseInt(form.get("rotationalSpeed")));
        computer.setStorageType(form.get("storageType"));

        computerRepo.save(computer);
        return"";
    }





    @GetMapping("/editComp/{productId}")
    public String editComp(@PathVariable("productId") Computer computer, Model model){
        model.addAttribute("computer",computer);
        return"productEdit";
    }

    @GetMapping("/editPhone/{productId}")
    public String editPhone(@PathVariable("productId") Phone phone, Model model){
        model.addAttribute("phone",phone);
        return"productEdit";
    }



}
