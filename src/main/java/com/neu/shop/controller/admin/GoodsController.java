package com.neu.shop.controller.admin;

import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.ImagePath;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

/**
 * Created by 文辉 on 2017/7/19.
 */

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/show")
    public String goodsManage(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("<script>alert('商品发布成功!');</script>");
        return "adminAllGoods";
    }

    @RequestMapping("/add")
    public String showAdd() {

        //还需要查询分类传给addGoods页面

        return "addGoods";
    }

    @RequestMapping("/addGoodsSuccess")
    public String addGoods(Goods goods, @RequestParam MultipartFile[] fileToUpload, HttpServletRequest request, HttpServletResponse response) throws IOException {

        goods.setCategory(1);
        goods.setUptime(new Date());
        goods.setActivityid(1);
        goodsService.addGoods(goods);

        for(MultipartFile multipartFile:fileToUpload){
            if (multipartFile != null){

                String realPath = request.getSession().getServletContext().getRealPath("/");
//                    String realPath = request.getContextPath();
                System.out.println(realPath);
                //图片路径
                String imagePath = realPath.substring(0,realPath.indexOf("shop")) + "shopimage\\" + UUID.randomUUID().toString().replace("-", "") + multipartFile.getOriginalFilename();

                //把图片路径存入数据库中
                goodsService.addImagePath(new ImagePath(null, goods.getGoodsid(),imagePath));
                //存图片
                multipartFile.transferTo(new File(imagePath));
            }
        }

        PrintWriter out = response.getWriter();
        out.print("<script>alert('商品添加成功！')</script>");

        return "redirect:/admin/goods/add";
    }
}
