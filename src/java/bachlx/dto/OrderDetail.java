/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachlx.dto;



/**
 *
 * @author AD
 */

public class OrderDetail {
    
    private int orderDetailID;
    private int orderID;
    private int planID;
    private String PlantName;
    private int price;
    private String ImgPath;
    private int quantity;

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getPlanID() {
        return planID;
    }

    public void setPlanID(int planID) {
        this.planID = planID;
    }
    

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return ImgPath;
    }

    public void setImgPath(String ImgPath) {
        this.ImgPath = ImgPath;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, int orderID, int planID, String PlantName, int price, String ImgPath, int quantity) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.planID = planID;
        this.PlantName = PlantName;
        this.price = price;
        this.ImgPath = ImgPath;
        this.quantity = quantity;
    }

    public String getPlantName() {
        return PlantName;
    }

    public void setPlantName(String PlantName) {
        this.PlantName = PlantName;
    }
    
    
    
    
}
