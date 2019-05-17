package com.DigitalStore.controller;

import com.DigitalStore.domain.Catalog;
import com.DigitalStore.domain.Items.Computer;
import com.DigitalStore.domain.Subcatalog;
import com.DigitalStore.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/")
public class MainController {


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

    @Autowired
    private SubcatalogRepo subcatalogRepo;

    @GetMapping("products/{catalog}/{subcatalog}")
    public String showProductBySubcatalog(@PathVariable("catalog") String catalogType,
                                          @PathVariable("subcatalog") Subcatalog subcatalog,
                                          Model model){

        switch (catalogType){
            case "Phone":{
                model.addAttribute("phones" ,phoneRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Notebook":{
                model.addAttribute("notebooks", notebookRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "TheTablet":{
                model.addAttribute("thetablets", theTabletRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Printer":{
                model.addAttribute("printers", printerRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Monitor":{
                model.addAttribute("monitors", monitorRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Monoblock":{
                model.addAttribute("monoblocks", monoblockRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", catalogType);
            }break;
            default:{
                model.addAttribute("computers", computerRepo.findBySubcatalogId(subcatalog.getId()));
                model.addAttribute("currentCatalog", "Computer");
            }break;
        }


        model.addAttribute("catalogs", getCatalogs());
        model.addAttribute("subb",getSubcatalogs());
        return "MainPage";
    }

    @GetMapping("products/{catalog}")
    public String showProduct(@PathVariable("catalog") String catalogType, Model model){
        switch (catalogType){
            case "Phone":{
                model.addAttribute("phones" ,phoneRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Notebook":{
                model.addAttribute("notebooks", notebookRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "TheTablet":{
                model.addAttribute("thetablets", theTabletRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Printer":{
                model.addAttribute("printers", printerRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Monitor":{
                model.addAttribute("monitors", monitorRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            case "Monoblock":{
                model.addAttribute("monoblocks", monoblockRepo.findAll());
                model.addAttribute("currentCatalog", catalogType);
            }break;
            default:{
                model.addAttribute("computers", computerRepo.findAll());
                model.addAttribute("currentCatalog", "Computer");
            }break;
        }

        model.addAttribute("catalogs", getCatalogs());
        model.addAttribute("subb",getSubcatalogs());
        return "MainPage";
    }


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

        Iterable<Computer> computers;
        computers = computerRepo.findAll();
        model.addAttribute("computers", computers);
        model.addAttribute("catalogs", getCatalogs());
        model.addAttribute("subb",getSubcatalogs());

        return "MainPage";
    }

    public Map<String, Iterable<Subcatalog>> getSubcatalogs(){
        Map<String, Iterable<Subcatalog>> sub = new HashMap<String, Iterable<Subcatalog>>();
        for(Catalog key : Catalog.values()){
            sub.put(key.toString(),subcatalogRepo.findByCatalogs(key));
        }
        return sub;
    }

    public Map<String, String> getCatalogs(){
        Map<String, String> catalogs = new HashMap<String, String>();
        for(Catalog key : Catalog.values()){
            switch (key.toString()){
                case "Computer":{
                    catalogs.put(key.toString(),"Компьютеры");
                }break;
                case "Monitor":{
                    catalogs.put(key.toString(),"Мониторы");
                }break;
                case "Monoblock":{
                    catalogs.put(key.toString(),"Моноблоки");
                }break;
                case "Notebook":{
                    catalogs.put(key.toString(),"Ноутбуки");
                }break;
                case "Phone":{
                    catalogs.put(key.toString(),"Телефоны");
                }break;
                case "Printer":{
                    catalogs.put(key.toString(),"Принтеры");
                }break;
                case "TheTablet":{
                    catalogs.put(key.toString(),"Планшеты");
                }break;
                default:break;
            }
        }
        return catalogs;
    }

}