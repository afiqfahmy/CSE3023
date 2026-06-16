package com.Model;

public class Car {
    protected int id;
    protected String model;
    protected String brand;
    protected double price;

    public Car() {}

    public Car(String model, String brand, double price) {
        super();
        this.model = model;
        this.brand = brand;
        this.price = price;
    }

    public Car(int id, String model, String brand, double price) {
        super();
        this.id = id;
        this.model = model;
        this.brand = brand;
        this.price = price;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}