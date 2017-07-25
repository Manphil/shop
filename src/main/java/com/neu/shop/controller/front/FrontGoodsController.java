package com.neu.shop.controller.front;

import com.neu.shop.pojo.Category;
import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.ImagePath;
import com.neu.shop.service.CateService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 文辉 on 2017/7/24.
 */
@Controller
public class FrontGoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private CateService cateService;

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detailGoods(Integer goodsid, Model model) {

        if(goodsid == null) {
            return "redirect:/main";
        }

        //要传回的数据存在HashMap中
        Map<String,Object> goodsInfo = new HashMap<String,Object>();

        //查询商品的基本信息
        Goods goods = goodsService.selectById(goodsid);

        //查询商品类别
        Category category = cateService.selectById(goods.getCategory());

        //商品图片
        List<ImagePath> imagePath = goodsService.findImagePath(goodsid);

        //商品评论

        //商品折扣信息

        //返回数据
        goodsInfo.put("goods", goods);
        goodsInfo.put("cate", category);
        goodsInfo.put("image", imagePath);
        goodsInfo.put("test",1);
        model.addAttribute("goodsInfo",goodsInfo);
//        model.addAllAttributes(goodsInfo);

        return "detail";
    }
}
