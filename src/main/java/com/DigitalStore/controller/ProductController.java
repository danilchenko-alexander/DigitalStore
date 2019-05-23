package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Items.*;
import com.DigitalStore.domain.Subcatalog;
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
@RequestMapping("/catalogList/{catalogName}")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class ProductController {

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


    @GetMapping("edit/{subcatalogId}")
    public String showSubcatalogProducts(@PathVariable String catalogName, @PathVariable Subcatalog subcatalogId, Model model) {

        switch (catalogName) {
            case "Computer": {
                Iterable<Computer> computers;
                computers = computerRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("computers", computers);
            }
            break;
            case "Monitor": {
                Iterable<Monitor> monitors;
                monitors = monitorRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("monitors", monitors);
            }
            break;
            case "Notebook": {
                Iterable<Notebook> notebooks;
                notebooks = notebookRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("notebooks", notebooks);
            }
            break;
            case "Monoblock": {
                Iterable<Monoblock> monoblocks;
                monoblocks = monoblockRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("monoblocks", monoblocks);
            }
            break;
            case "Phone": {
                Iterable<Phone> phones;
                phones = phoneRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("phones", phones);
            }
            break;
            case "Printer": {
                Iterable<Printer> printers;
                printers = printerRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("printers", printers);
            }
            break;
            case "TheTablet": {
                Iterable<TheTablet> theTablets;
                theTablets = theTabletRepo.findBySubcatalogId(subcatalogId.getId());
                model.addAttribute("theTablets", theTablets);
            }
            break;
        }

        model.addAttribute("subcatalog", subcatalogId);
        model.addAttribute("catalog", catalogName);
        return "productList";
    }

    @GetMapping("edit/{subcatalog}/editComputer/{id}")
    public String editComputer(@PathVariable("id") Computer computer,
                               @PathVariable("subcatalog") Subcatalog subcatalog,
                               @PathVariable("catalogName") String catalog,
                               Model model){
        model.addAttribute("catalog", catalog);
        model.addAttribute("subcatalog",subcatalog);
        model.addAttribute("computer",computer);
        return"productEdit";
    }

    @GetMapping("edit/{subcatalog}/editPhone/{id}")
    public String editPhone(@PathVariable("id") Phone phone,
                               @PathVariable("subcatalog") Subcatalog subcatalog,
                               @PathVariable("catalogName") String catalog,
                               Model model){
        model.addAttribute("catalog", catalog);
        model.addAttribute("subcatalog",subcatalog);
        model.addAttribute("phone",phone);
        return"productEdit";
    }

        @PostMapping("/saveEditedComp")
    public String saveComputer(@RequestParam Map<String, String> form,
                               @RequestParam("compId") Computer computer,
                               @RequestParam("file") MultipartFile file) throws IOException {

        computer = setComp(computer, form);
        computer.setFilename(saveFile(file));
        computerRepo.save(computer);
        return"redirect:/catalogList/{catalogName}";
    }

    @PostMapping("/saveEditedPhone")
    public String savePhone(@RequestParam Map<String, String> form,
                               @RequestParam("phoneId") Phone phone,
                               @RequestParam("file") MultipartFile file) throws IOException {
        phone = setPhone(phone, form);
        phone.setFilename(saveFile(file));
        phoneRepo.save(phone);
        return"redirect:/catalogList/{catalogName}";
    }

    @PostMapping("edit/{subcatalog}/saveComputer")
    public String addComputer
            (@PathVariable("subcatalog") Subcatalog subcatalog,
             @RequestParam("file") MultipartFile file,
             @RequestParam Map<String, String> form) throws IOException {
        Computer computer = new Computer();
        computer = setComp(computer,form);
        computer.setFilename(saveFile(file));
        computer.setSubcatalog(subcatalog);
        computerRepo.save(computer);
        return "redirect:/catalogList/{catalogName}/edit/"+subcatalog.getId();
    }

    @PostMapping("edit/{subcatalog}/savePhone")
    public String addPhone
            (@PathVariable("subcatalog") Subcatalog subcatalog,
             @RequestParam("file") MultipartFile file,
             @RequestParam Map<String, String> form) throws IOException {
        Phone phone = new Phone();
        phone = setPhone(phone,form);
        phone.setFilename(saveFile(file));
        phone.setSubcatalog(subcatalog);
        phoneRepo.save(phone);
        return "redirect:/catalogList/{catalogName}/edit/"+subcatalog.getId();
    }


    @PostMapping("edit/{subcatalog}/deleteComputer")
    public String deleteComputer(@RequestParam("compId") Computer computer,
                                 @PathVariable("subcatalog") Subcatalog subcatalog,
                                 Model model){
        if(computer.getFilename()!=null) {
            File file = new File(uploadPath + "/" + computer.getFilename());
            file.delete();
        }
        computerRepo.deleteById(computer.getId());

        return "redirect:/catalogList/{catalogName}/edit/{subcatalog}";
    }

    @PostMapping("edit/{subcatalog}/deletePhone")
    public String deletePhone(@RequestParam("phoneId") Phone phone,
                              @PathVariable("subcatalog") Subcatalog subcatalog,
                              Model model){
        if(phone.getFilename()!=null) {
            File file = new File(uploadPath + "/" + phone.getFilename());
            file.delete();
        }
        phoneRepo.deleteById(phone.getId());

        return "redirect:/catalogList/{catalogName}/edit/{subcatalog}";
    }


    public Phone setPhone(Phone phone, Map<String, String> form){
        phone.setName(form.get("name"));
        if(!form.get("price").isEmpty())
            phone.setPrice(Double.parseDouble(form.get("price")));
        phone.setDescription(form.get("description"));
        phone.setCamera(form.get("camera"));
        if(!form.get("numOfSim").isEmpty())
            phone.setNumOfSim(Integer.parseInt(form.get("numOfSim")));
        if(!form.get("numOfDots").isEmpty())
            phone.setNumOfDots(Integer.parseInt(form.get("numOfDots")));
        phone.setOS(form.get("OS"));
        phone.setScreenSize(form.get("screenSize"));
        phone.setScreenResolution(form.get("screenResolution"));
        if(!form.get("RAM").isEmpty())
            phone.setRAM(Integer.parseInt(form.get("RAM")));
        if(!form.get("flashMemory").isEmpty())
            phone.setFlashMemory(Integer.parseInt(form.get("flashMemory")));
        if(!form.get("numOfCores").isEmpty())
            phone.setNumOfCores(Integer.parseInt(form.get("numOfCores")));
        phone.setPlatform(form.get("platform"));
        phone.setCapacityCPU(form.get("capacityCPU"));
        phone.setFrequencyCPU(form.get("frequencyCPU"));
        phone.setNameCPU(form.get("nameCPU"));
        return phone;
    }

    public Computer setComp(Computer computer, Map<String, String> form){
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
        return computer;
    }

    public String saveFile(MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            return resultFilename;
        }
        return null;
    }

}
