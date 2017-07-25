package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.AddressService;
import com.neu.shop.service.GoodsService;
import com.neu.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 文辉 on 2017/7/25.
 */
@Controller
public class OrderController {

    @Value("#{addressService}")
    private AddressService addressService;

    @Autowired
    private ShopCartService shopCartService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/order")
    public String showOrder(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        //查询当前用户的收货地址
        AddressExample addressExample = new AddressExample();
        addressExample.or().andUseridEqualTo(user.getUserid());
        List<Address> addressList = addressService.getAllAddressByExample(addressExample);

        model.addAttribute("address", addressList);

        //订单信息
        //获取当前用户的购物车信息
        ShopCartExample shopCartExample = new ShopCartExample();
        shopCartExample.or().andUseridEqualTo(user.getUserid());
        List<ShopCart> shopCart = shopCartService.selectByExample(shopCartExample);

        //获取购物车中的商品信息
        List<Goods> goodsAndImage = new ArrayList<>();
        for (ShopCart cart:shopCart) {
            Goods goods = goodsService.selectById(cart.getGoodsid());

            List<ImagePath> imagePathList = goodsService.findImagePath(goods.getGoodsid());
            goods.setImagePaths(imagePathList);
            goods.setNum(cart.getGoodsnum());
            goodsAndImage.add(goods);
        }

        model.addAttribute("goodsAndImage", goodsAndImage);

        return "orderConfirm";
    }
}
