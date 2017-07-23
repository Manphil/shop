package com.neu.shop.controller.front;

import com.neu.shop.pojo.Category;
import com.neu.shop.pojo.CategoryExample;
import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.GoodsExample;
import com.neu.shop.service.CateService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

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

        //查询数码分类
        CategoryExample digCategoryExample = new CategoryExample();
        digCategoryExample.or().andCatenameLike("数码");
        List<Category> digCategoryList = cateService.selectByExample(digCategoryExample);

        //查询属于数码
        GoodsExample digGoodsExample = new GoodsExample();
        List<Integer> digCateId = new ArrayList<Integer>();
        for (Category tmp:digCategoryList) {
            digCateId.add(tmp.getCateid());
        }
        digGoodsExample.or().andCategoryIn(digCateId);

        List<Goods> digGoods = goodsService.selectByExample(digGoodsExample);

        model.addAttribute("digGoods", digGoods);




        return "main";
    }
}
