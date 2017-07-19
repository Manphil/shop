package com.neu.shop.controller.admin;

import com.neu.shop.service.GoodsService;
import com.neu.shop.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * Created by 文辉 on 2017/7/19.
 */

@Controller
@RequestMapping("/admin")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/addGoods")
    public String addGoods(Goods goods) {
        goods.setCategory(1);
        goods.setUptime(new Date());
        goods.setActivityid(1);
        goodsService.addGoods(goods);
        return "addGoods";
    }
}
