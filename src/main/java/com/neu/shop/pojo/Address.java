package com.neu.shop.pojo;

public class Address {
    private Integer addressid;

    private Integer userid;

    private String detailaddr;

    private String conname;

    private String contel;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getDetailaddr() {
        return detailaddr;
    }

    public void setDetailaddr(String detailaddr) {
        this.detailaddr = detailaddr == null ? null : detailaddr.trim();
    }

    public String getConname() {
        return conname;
    }

    public void setConname(String conname) {
        this.conname = conname == null ? null : conname.trim();
    }

    public String getContel() {
        return contel;
    }

    public void setContel(String contel) {
        this.contel = contel == null ? null : contel.trim();
    }
}