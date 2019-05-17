package com.DigitalStore.domain.Items;


import com.DigitalStore.domain.Subcatalog;

import javax.persistence.*;

@Entity
@Table(name = "monitor")
public class Monitor extends Product{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    //основные
    private Integer diagonal; //диагональ экрана
    private String matrix; //TN+Film
    private String aspectRatio; //соотношение сторон (прим 16:9)
    private String resolution; //разрешение экрана
    private Integer screenRefreshRate; //частота обновления экрана Гц
    private String Support3d; // поддержка 3D

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Subcatalog subcatalog;

    public Monitor() {
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

    public Integer getDiagonal() {
        return diagonal;
    }

    public void setDiagonal(Integer diagonal) {
        this.diagonal = diagonal;
    }

    public String getMatrix() {
        return matrix;
    }

    public void setMatrix(String matrix) {
        this.matrix = matrix;
    }

    public String getAspectRatio() {
        return aspectRatio;
    }

    public void setAspectRatio(String aspectRatio) {
        this.aspectRatio = aspectRatio;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public Integer getScreenRefreshRate() {
        return screenRefreshRate;
    }

    public void setScreenRefreshRate(Integer screenRefreshRate) {
        this.screenRefreshRate = screenRefreshRate;
    }

    public String getSupport3d() {
        return Support3d;
    }

    public void setSupport3d(String support3d) {
        Support3d = support3d;
    }
}
