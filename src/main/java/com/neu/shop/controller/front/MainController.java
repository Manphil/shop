package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.CateService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 文辉 on 2017/7/18.
 */
@Controller
public class MainController {

    @Autowired
    private CateService cateService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/main")
    public String showAllGoods(Model model) {

        //数码分类
        Map<Goods,List<ImagePath>> digGoods = getCateGoods("数码");
        model.addAttribute("digGoods", digGoods);

        //家电
        Map<Goods,List<ImagePath>> houseGoods = getCateGoods("家电");
        model.addAttribute("houseGoods", houseGoods);

        //服饰
        Map<Goods,List<ImagePath>> colGoods = getCateGoods("服饰");
        model.addAttribute("colGoods", colGoods);

        //书籍
        Map<Goods,List<ImagePath>> bookGoods = getCateGoods("书籍");
        model.addAttribute("bookGoods", bookGoods);

        return "main";
    }

    public Map<Goods,List<ImagePath>> getCateGoods(String cate) {
        //查询分类
        CategoryExample digCategoryExample = new CategoryExample();
        digCategoryExample.or().andCatenameLike(cate);
        List<Category> digCategoryList = cateService.selectByExample(digCategoryExample);

        //查询属于刚查到的分类的商品
        GoodsExample digGoodsExample = new GoodsExample();
        List<Integer> digCateId = new ArrayList<Integer>();
        for (Category tmp:digCategoryList) {
            digCateId.add(tmp.getCateid());
        }
        digGoodsExample.or().andCategoryIn(digCateId);

        List<Goods> goodsList = goodsService.selectByExampleLimit(digGoodsExample);

        Map<Goods,List<ImagePath>> goodsAndImage = new HashMap<Goods,List<ImagePath>>();
        //获取每个商品的图片
        for (Goods goods:goodsList) {
            List<ImagePath> imagePathList = goodsService.findImagePath(goods.getGoodsid());
            goodsAndImage.put(goods, imagePathList);
        }
        return goodsAndImage;
    }
}
