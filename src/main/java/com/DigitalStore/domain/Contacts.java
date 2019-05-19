package com.DigitalStore.domain;


import javax.persistence.*;

@Entity
@Table(name = "contacts")
public class Contacts {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 512)
    private String timeWorking;

    @Column(length = 512)
    private String phoneNumbers;

    @Column(length = 512)
    private String links;

    private String address;

    public Contacts() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTimeWorking() {
        return timeWorking;
    }

    public void setTimeWorking(String timeWorking) {
        this.timeWorking = timeWorking;
    }

    public String getPhoneNumbers() {
        return phoneNumbers;
    }

    public void setPhoneNumbers(String phoneNumbers) {
        this.phoneNumbers = phoneNumbers;
    }

    public String getLinks() {
        return links;
    }

    public void setLinks(String links) {
        this.links = links;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
