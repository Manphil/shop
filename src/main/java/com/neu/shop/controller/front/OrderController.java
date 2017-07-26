package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.AddressService;
import com.neu.shop.service.GoodsService;
import com.neu.shop.service.OrderService;
import com.neu.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 文辉 on 2017/7/25.
 */
@Controller
public class OrderController {

    /*@Value("#{addressService}")*/
    @Autowired
    private AddressService addressService;

    @Autowired
    private ShopCartService shopCartService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

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

    @RequestMapping("/orderFinish")
    @ResponseBody
    public Msg orderFinish(Integer oldPrice, Integer newPrice, Boolean isPay, Integer addressid,HttpSession session) {
        User user = (User) session.getAttribute("user");

        //获取订单信息
        ShopCartExample shopCartExample = new ShopCartExample();
        shopCartExample.or().andUseridEqualTo(user.getUserid());
        List<ShopCart> shopCart = shopCartService.selectByExample(shopCartExample);

        //删除购物车
        for (ShopCart cart : shopCart) {
            shopCartService.deleteByKey(new ShopCartKey(cart.getUserid(),cart.getGoodsid()));
        }

        //把订单信息写入数据库
        Order order = new Order(null, user.getUserid(), new Date(), oldPrice, newPrice, isPay, false, false, false, addressid,null,null);
        orderService.insertOrder(order);
        //插入的订单号
        Integer orderId = order.getOrderid();

        //把订单项写入orderitem表中
        for (ShopCart cart : shopCart) {
            orderService.insertOrderItem(new OrderItem(null, orderId, cart.getGoodsid(), cart.getGoodsnum()));
        }

        return Msg.success("购买成功");
    }

}
