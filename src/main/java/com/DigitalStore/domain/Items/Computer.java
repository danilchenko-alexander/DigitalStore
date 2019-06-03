package com.DigitalStore.domain.Items;


import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "computer")
public class Computer extends Product {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //основные
    private Integer numCPU;//кол-во процесосров
    private String nameCPU; //название процессора


    //CPU
    private Integer numOfCores; //кол-во ядер
    private Integer frequency; // тактовая частота
    private Integer sharedCache; //кэш(общий , L2 или L3)
    private String chipset; //чипсет

    //RAM
    private String numOfSlots; //кол-во слотов памяти
    private Integer maxMemorySize;//максимальный объем памяти
    private Integer memorySize; // объем памяти
    private String typeRAM; //тип оперативной памяти
    private Integer frequencyRAM; // частота оперативной памяти

    //графика
    private String graphicAdapter; //графический адаптер(видеокарта)
    private String typeOfGraphicAdapter; //тип графического адаптера

    //хранение данных
    private Integer storageCapacity; //емкость накопителя
    private String memoryCards; //карты памяти
    private String configCapacity; //конфигурация накопителя
    private Integer rotationalSpeed; //скорость вращения
    private String storageType; //тип

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Computer() {
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

    public Integer getNumCPU() {
        return numCPU;
    }

    public void setNumCPU(Integer numCPU) {
        this.numCPU = numCPU;
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

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public Integer getSharedCache() {
        return sharedCache;
    }

    public void setSharedCache(Integer sharedCache) {
        this.sharedCache = sharedCache;
    }

    public String getChipset() {
        return chipset;
    }

    public void setChipset(String chipset) {
        this.chipset = chipset;
    }

    public String getNumOfSlots() {
        return numOfSlots;
    }

    public void setNumOfSlots(String numOfSlots) {
        this.numOfSlots = numOfSlots;
    }

    public Integer getMaxMemorySize() {
        return maxMemorySize;
    }

    public void setMaxMemorySize(Integer maxMemorySize) {
        this.maxMemorySize = maxMemorySize;
    }

    public Integer getMemorySize() {
        return memorySize;
    }

    public void setMemorySize(Integer memorySize) {
        this.memorySize = memorySize;
    }

    public String getTypeRAM() {
        return typeRAM;
    }

    public void setTypeRAM(String typeRAM) {
        this.typeRAM = typeRAM;
    }

    public Integer getFrequencyRAM() {
        return frequencyRAM;
    }

    public void setFrequencyRAM(Integer frequencyRAM) {
        this.frequencyRAM = frequencyRAM;
    }

    public String getGraphicAdapter() {
        return graphicAdapter;
    }

    public void setGraphicAdapter(String graphicAdapter) {
        this.graphicAdapter = graphicAdapter;
    }

    public String getTypeOfGraphicAdapter() {
        return typeOfGraphicAdapter;
    }

    public void setTypeOfGraphicAdapter(String typeOfGraphicAdapter) {
        this.typeOfGraphicAdapter = typeOfGraphicAdapter;
    }

    public Integer getStorageCapacity() {
        return storageCapacity;
    }

    public void setStorageCapacity(Integer storageCapacity) {
        this.storageCapacity = storageCapacity;
    }

    public String getMemoryCards() {
        return memoryCards;
    }

    public void setMemoryCards(String memoryCards) {
        this.memoryCards = memoryCards;
    }

    public String getConfigCapacity() {
        return configCapacity;
    }

    public void setConfigCapacity(String configCapacity) {
        this.configCapacity = configCapacity;
    }

    public Integer getRotationalSpeed() {
        return rotationalSpeed;
    }

    public void setRotationalSpeed(Integer rotationalSpeed) {
        this.rotationalSpeed = rotationalSpeed;
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType;
    }
}
