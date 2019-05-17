package com.DigitalStore.domain.Items;

import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "Phone")
public class Phone extends Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //основные
    private String camera; //встроенная камера
    private Integer numOfSim; //кол-во сим карт
    private Integer numOfDots; //кол-во точек матрицы
    private String OS; //операционная система
    private String screenSize; //размер экрана
    private String screenResolution; //разрешение экрана
    private Integer RAM; //оперативная память
    private Integer flashMemory; //флэш-память


    //CPU
    private Integer numOfCores; //кол-во ядер
    private String platform; //платформа
    private String capacityCPU; //разрядность процессора
    private String frequencyCPU; //тактовая частота процесосра
    private String nameCPU; //название процессора

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Phone() {
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

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public Integer getNumOfSim() {
        return numOfSim;
    }

    public void setNumOfSim(Integer numOfSim) {
        this.numOfSim = numOfSim;
    }

    public Integer getNumOfDots() {
        return numOfDots;
    }

    public void setNumOfDots(Integer numOfDots) {
        this.numOfDots = numOfDots;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(String screenSize) {
        this.screenSize = screenSize;
    }

    public String getScreenResolution() {
        return screenResolution;
    }

    public void setScreenResolution(String screenResolution) {
        this.screenResolution = screenResolution;
    }

    public Integer getRAM() {
        return RAM;
    }

    public void setRAM(Integer RAM) {
        this.RAM = RAM;
    }

    public Integer getFlashMemory() {
        return flashMemory;
    }

    public void setFlashMemory(Integer flashMemory) {
        this.flashMemory = flashMemory;
    }

    public Integer getNumOfCores() {
        return numOfCores;
    }

    public void setNumOfCores(Integer numOfCores) {
        this.numOfCores = numOfCores;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getCapacityCPU() {
        return capacityCPU;
    }

    public void setCapacityCPU(String capacityCPU) {
        this.capacityCPU = capacityCPU;
    }

    public String getFrequencyCPU() {
        return frequencyCPU;
    }

    public void setFrequencyCPU(String frequencyCPU) {
        this.frequencyCPU = frequencyCPU;
    }

    public String getNameCPU() {
        return nameCPU;
    }

    public void setNameCPU(String nameCPU) {
        this.nameCPU = nameCPU;
    }

    public void setSubcatalog(Subcatalog subcatalog) {
        this.subcatalog = subcatalog;
    }
}

