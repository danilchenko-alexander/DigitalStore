package com.DigitalStore.domain.Items;


import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "TheTablet")
public class TheTablet extends Product{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //основные
    private String voiceCalls; //голосовые вызовы
    private String graphicAccelerator; // графический ускоритель
    private String diagonal; //диагональ экрана
    private String matrix; //матрица экрана
    private String OS; //операционная система
    private String nameCPU; //процессор
    private String screenResolution; //разрешение экрана
    private String RAM; //оперативная память
    private String memory; //внутренняя память

    //CPU
    private String numOfcores; //кол-во ядер
    private String frequency; //тактовая частота

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public TheTablet() {
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

    public String getVoiceCalls() {
        return voiceCalls;
    }

    public void setVoiceCalls(String voiceCalls) {
        this.voiceCalls = voiceCalls;
    }

    public String getGraphicAccelerator() {
        return graphicAccelerator;
    }

    public void setGraphicAccelerator(String graphicAccelerator) {
        this.graphicAccelerator = graphicAccelerator;
    }

    public String getDiagonal() {
        return diagonal;
    }

    public void setDiagonal(String diagonal) {
        this.diagonal = diagonal;
    }

    public String getMatrix() {
        return matrix;
    }

    public void setMatrix(String matrix) {
        this.matrix = matrix;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getNameCPU() {
        return nameCPU;
    }

    public void setNameCPU(String nameCPU) {
        this.nameCPU = nameCPU;
    }

    public String getScreenResolution() {
        return screenResolution;
    }

    public void setScreenResolution(String screenResolution) {
        this.screenResolution = screenResolution;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getNumOfcores() {
        return numOfcores;
    }

    public void setNumOfcores(String numOfcores) {
        this.numOfcores = numOfcores;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
}
