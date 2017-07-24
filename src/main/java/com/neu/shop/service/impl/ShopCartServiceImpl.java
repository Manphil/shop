package com.neu.shop.service.impl;

import com.neu.shop.dao.ShopCartMapper;
import com.neu.shop.pojo.ShopCart;
import com.neu.shop.pojo.ShopCartExample;
import com.neu.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/24.
 */
@Service("addShopCart")
public class ShopCartServiceImpl implements ShopCartService {

    @Autowired(required = false)
    ShopCartMapper shopCartMapper;

    @Override
    public void addShopCart(ShopCart shopCart) {
        shopCartMapper.insert(shopCart);
    }

    @Override
    public List<ShopCart> selectByExample(ShopCartExample shopCartExample) {

        return shopCartMapper.selectByExample(shopCartExample);
    }
}
