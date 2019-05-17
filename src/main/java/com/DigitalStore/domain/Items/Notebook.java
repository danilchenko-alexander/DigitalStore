package com.DigitalStore.domain.Items;


import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "NotebookRepo")
public class Notebook extends Product{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //экран
    private String diagonal;
    private String touchScreen; //Сенсорный экран
    private String matrixFreqency; //частота матрицы
    private String resolution; //разрешение экрана

    //CPU
    private String turboFrequency; //Turbo-частота
    private String frequency; // тактовая частота
    private String nameCPU; //модель ЦПУ
    private String numOfCores; //количесто ядер

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Notebook() {
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

    public String getDiagonal() {
        return diagonal;
    }

    public void setDiagonal(String diagonal) {
        this.diagonal = diagonal;
    }

    public String getTouchScreen() {
        return touchScreen;
    }

    public void setTouchScreen(String touchScreen) {
        this.touchScreen = touchScreen;
    }

    public String getMatrixFreqency() {
        return matrixFreqency;
    }

    public void setMatrixFreqency(String matrixFreqency) {
        this.matrixFreqency = matrixFreqency;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getTurboFrequency() {
        return turboFrequency;
    }

    public void setTurboFrequency(String turboFrequency) {
        this.turboFrequency = turboFrequency;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getNameCPU() {
        return nameCPU;
    }

    public void setNameCPU(String nameCPU) {
        this.nameCPU = nameCPU;
    }

    public String getNumOfCores() {
        return numOfCores;
    }

    public void setNumOfCores(String numOfCores) {
        this.numOfCores = numOfCores;
    }
}
