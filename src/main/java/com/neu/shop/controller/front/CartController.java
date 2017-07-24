package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.GoodsService;
import com.neu.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by 文辉 on 2017/7/24.
 */
@Controller
public class CartController {

    @Autowired
    private ShopCartService shopCartService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/addCart")
    public String addCart(ShopCart shopCart, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }

        //用户
        shopCart.setUserid(user.getUserid());

        //加入时间
        shopCart.setCatedate(new Date());

        shopCartService.addShopCart(shopCart);

        //返回到购物车页面
        return "redirect:/showcart";
    }

    @RequestMapping("/showcart")
    public String showCart() {
        return "shopcart";
    }

    @RequestMapping("/cartjson")
    @ResponseBody
    public Msg getCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return Msg.fail("请先登录");
        }

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

        return Msg.success("查询成功").add("shopcart",goodsAndImage);
    }

    @RequestMapping(value = "/deleteCart/{goodsid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteCart(@PathVariable("goodsid")Integer goodsid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        shopCartService.deleteByKey(new ShopCartKey(user.getUserid(), goodsid));
        return Msg.success("删除成功");
    }
}
