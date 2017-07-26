package com.neu.shop.pojo;

import java.util.Date;
import java.util.List;

public class Order {
    private Integer orderid;

    private Integer userid;

    private Date ordertime;

    private Integer oldprice;

    private Integer newprice;

    private Boolean ispay;

    private Boolean issend;

    private Boolean isreceive;

    private Boolean iscomplete;

    private Integer addressid;

    private List<Goods> goodsInfo;

    private Address address;

    public Order() {
    }

    public Order(Integer orderid, Integer userid, Date ordertime, Integer oldprice, Integer newprice, Boolean ispay, Boolean issend, Boolean isreceive, Boolean iscomplete, Integer addressid, List<Goods> goodsInfo, Address address) {
        this.orderid = orderid;
        this.userid = userid;
        this.ordertime = ordertime;
        this.oldprice = oldprice;
        this.newprice = newprice;
        this.ispay = ispay;
        this.issend = issend;
        this.isreceive = isreceive;
        this.iscomplete = iscomplete;
        this.addressid = addressid;
        this.goodsInfo = goodsInfo;
        this.address = address;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getOldprice() {
        return oldprice;
    }

    public void setOldprice(Integer oldprice) {
        this.oldprice = oldprice;
    }

    public Integer getNewprice() {
        return newprice;
    }

    public void setNewprice(Integer newprice) {
        this.newprice = newprice;
    }

    public Boolean getIspay() {
        return ispay;
    }

    public void setIspay(Boolean ispay) {
        this.ispay = ispay;
    }

    public Boolean getIssend() {
        return issend;
    }

    public void setIssend(Boolean issend) {
        this.issend = issend;
    }

    public Boolean getIsreceive() {
        return isreceive;
    }

    public void setIsreceive(Boolean isreceive) {
        this.isreceive = isreceive;
    }

    public Boolean getIscomplete() {
        return iscomplete;
    }

    public void setIscomplete(Boolean iscomplete) {
        this.iscomplete = iscomplete;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public List<Goods> getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(List<Goods> goodsInfo) {
        this.goodsInfo = goodsInfo;
    }


    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}