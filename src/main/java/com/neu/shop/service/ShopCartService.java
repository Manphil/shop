package com.neu.shop.service;

import com.neu.shop.pojo.ShopCart;
import com.neu.shop.pojo.ShopCartExample;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/24.
 */
public interface ShopCartService {
    public void addShopCart(ShopCart shopCart);

    public List<ShopCart> selectByExample(ShopCartExample shopCartExample);
}
