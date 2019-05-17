package com.DigitalStore.domain.Items;

import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "Printer")
public class Printer extends Product{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //основные
    private String numOfColors; //кол-во цветов
    private String OS; //операционная система
    private String supportedCartridges; //поддерживаемые картриджи
    private String resourceCartrodge; //ресурс картриджа
    private String printSpeed; //скорость печати
    private String printTechnology; //технология печати
    private String format; //формат

    //принтер
    private String timeForFirstPage; //время выхода первой страницы
    private String maxMonthLoad; // максимальная месячная загрузка
    private String maxResDpi; //максимальное разрешение (dpi)
    private String workingNoise; //уровень шума при работе
    private String bultInStapler; //встроенный сшиватель

    //лотки
    private String inputTrayCapacity; //вместимость входных лотков
    private String outputTrayCapacity; //вместимость выходных лотков

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Printer() {
    }

    public Subcatalog getSubcatalog() {
        return subcatalog;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public void setSubcatalog(Subcatalog subcatalog) {
        this.subcatalog = subcatalog;
    }

    public String getNumOfColors() {
        return numOfColors;
    }

    public void setNumOfColors(String numOfColors) {
        this.numOfColors = numOfColors;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getSupportedCartridges() {
        return supportedCartridges;
    }

    public void setSupportedCartridges(String supportedCartridges) {
        this.supportedCartridges = supportedCartridges;
    }

    public String getResourceCartrodge() {
        return resourceCartrodge;
    }

    public void setResourceCartrodge(String resourceCartrodge) {
        this.resourceCartrodge = resourceCartrodge;
    }

    public String getPrintSpeed() {
        return printSpeed;
    }

    public void setPrintSpeed(String printSpeed) {
        this.printSpeed = printSpeed;
    }

    public String getPrintTechnology() {
        return printTechnology;
    }

    public void setPrintTechnology(String printTechnology) {
        this.printTechnology = printTechnology;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getTimeForFirstPage() {
        return timeForFirstPage;
    }

    public void setTimeForFirstPage(String timeForFirstPage) {
        this.timeForFirstPage = timeForFirstPage;
    }

    public String getMaxMonthLoad() {
        return maxMonthLoad;
    }

    public void setMaxMonthLoad(String maxMonthLoad) {
        this.maxMonthLoad = maxMonthLoad;
    }

    public String getMaxResDpi() {
        return maxResDpi;
    }

    public void setMaxResDpi(String maxResDpi) {
        this.maxResDpi = maxResDpi;
    }

    public String getWorkingNoise() {
        return workingNoise;
    }

    public void setWorkingNoise(String workingNoise) {
        this.workingNoise = workingNoise;
    }

    public String getBultInStapler() {
        return bultInStapler;
    }

    public void setBultInStapler(String bultInStapler) {
        this.bultInStapler = bultInStapler;
    }

    public String getInputTrayCapacity() {
        return inputTrayCapacity;
    }

    public void setInputTrayCapacity(String inputTrayCapacity) {
        this.inputTrayCapacity = inputTrayCapacity;
    }

    public String getOutputTrayCapacity() {
        return outputTrayCapacity;
    }

    public void setOutputTrayCapacity(String outputTrayCapacity) {
        this.outputTrayCapacity = outputTrayCapacity;
    }
}
