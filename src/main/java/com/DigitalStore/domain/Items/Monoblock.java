package com.DigitalStore.domain.Items;


import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "MonoblockRepo")
public class Monoblock extends Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //экран
    private String screen3d; //поддержка 3д
    private String lightSensor; //датчик освещенности
    private Integer diagonal; //диагональ
    private String screenSurface; //поверхность экрана
    private Integer resolutionH; // разрешение экрана (высота)
    private Integer resolutionW; // разрешение экрана (ширина)

    //CPU
    private Integer turboFrequency; //Turbo-частота
    private Integer frequency; // тактовая частота
    private String nameCPU; //модель ЦПУ
    private Integer numOfCores; //количесто ядер
    private String cache; //кэш

    //RAM
    private Integer numOfSlots; //количество слотов памяти
    private Integer sizeRAM; //объем памяти
    private String typeRAM; //тип оперативной памяти

    //хранение данных
    private Integer capacitySSD; //емкость SSD
    private Integer capacityHDD; //емкость HDD
    private String typeCapacity; //тип накопителя

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Monoblock() {
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

    public String getScreen3d() {
        return screen3d;
    }

    public void setScreen3d(String screen3d) {
        this.screen3d = screen3d;
    }

    public String getLightSensor() {
        return lightSensor;
    }

    public void setLightSensor(String lightSensor) {
        this.lightSensor = lightSensor;
    }

    public Integer getDiagonal() {
        return diagonal;
    }

    public void setDiagonal(Integer diagonal) {
        this.diagonal = diagonal;
    }

    public String getScreenSurface() {
        return screenSurface;
    }

    public void setScreenSurface(String screenSurface) {
        this.screenSurface = screenSurface;
    }

    public Integer getResolutionH() {
        return resolutionH;
    }

    public void setResolutionH(Integer resolutionH) {
        this.resolutionH = resolutionH;
    }

    public Integer getResolutionW() {
        return resolutionW;
    }

    public void setResolutionW(Integer resolutionW) {
        this.resolutionW = resolutionW;
    }

    public Integer getTurboFrequency() {
        return turboFrequency;
    }

    public void setTurboFrequency(Integer turboFrequency) {
        this.turboFrequency = turboFrequency;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public String getNameCPU() {
        return nameCPU;
    }

    public void setNameCPU(String nameCPU) {
        this.nameCPU = nameCPU;
    }

    public Integer getNumOfCores() {
        return numOfCores;
    }

    public void setNumOfCores(Integer numOfCores) {
        this.numOfCores = numOfCores;
    }

    public String getCache() {
        return cache;
    }

    public void setCache(String cache) {
        this.cache = cache;
    }

    public Integer getNumOfSlots() {
        return numOfSlots;
    }

    public void setNumOfSlots(Integer numOfSlots) {
        this.numOfSlots = numOfSlots;
    }

    public Integer getSizeRAM() {
        return sizeRAM;
    }

    public void setSizeRAM(Integer sizeRAM) {
        this.sizeRAM = sizeRAM;
    }

    public String getTypeRAM() {
        return typeRAM;
    }

    public void setTypeRAM(String typeRAM) {
        this.typeRAM = typeRAM;
    }

    public Integer getCapacitySSD() {
        return capacitySSD;
    }

    public void setCapacitySSD(Integer capacitySSD) {
        this.capacitySSD = capacitySSD;
    }

    public Integer getCapacityHDD() {
        return capacityHDD;
    }

    public void setCapacityHDD(Integer capacityHDD) {
        this.capacityHDD = capacityHDD;
    }

    public String getTypeCapacity() {
        return typeCapacity;
    }

    public void setTypeCapacity(String typeCapacity) {
        this.typeCapacity = typeCapacity;
    }
}
