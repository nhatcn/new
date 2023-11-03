/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NGMINHAT
 */
public class Product {
    String proID;
    String proName;
    int proQuan;
    double proPrice;
    String proPic;
    String proDes;

    public Product() {
    }

    public Product(String proID, String proName, int proQuan, double proPrice, String proPic, String proDes) {
        this.proID = proID;
        this.proName = proName;
        this.proQuan = proQuan;
        this.proPrice = proPrice;
        this.proPic = proPic;
        this.proDes = proDes;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public int getProQuan() {
        return proQuan;
    }

    public void setProQuan(int proQuan) {
        this.proQuan = proQuan;
    }

    public double getProPrice() {
        return proPrice;
    }

    public void setProPrice(double proPrice) {
        this.proPrice = proPrice;
    }

    public String getProPic() {
        return proPic;
    }

    public void setProPic(String proPic) {
        this.proPic = proPic;
    }

    public String getProDes() {
        return proDes;
    }

    public void setProDes(String proDes) {
        this.proDes = proDes;
    }
    
}
