package com.neu.shop.controller.front;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.shop.pojo.*;
import com.neu.shop.service.CateService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchGoods(@RequestParam(value = "page",defaultValue = "1") Integer pn, String keyword, Model model) {
        //一页显示几个数据
        PageHelper.startPage(pn, 16);

        //查询数据
        GoodsExample goodsExample = new GoodsExample();
        goodsExample.or().andGoodsnameLike("%" + keyword + "%");
        List<Goods> goodsList = goodsService.selectByExample(goodsExample);

        //获取图片地址
        for (int i = 0; i < goodsList.size(); i++) {
            Goods goods = goodsList.get(i);

            List<ImagePath> imagePathList = goodsService.findImagePath(goods.getGoodsid());

            goods.setImagePaths(imagePathList);

            goodsList.set(i, goods);
        }

        //显示几个页号
        PageInfo page = new PageInfo(goodsList,5);
        model.addAttribute("pageInfo", page);
        model.addAttribute("keyword", keyword);

        return "search";
    }

    @RequestMapping("/collect")
    public Msg collectGoods(Integer goodsid, HttpSession session) {
        //取登录用户信息,未登录重定向至登录页面
        User user = (User) session.getAttribute("user");

        return Msg.success("收藏成功");
    }
}
