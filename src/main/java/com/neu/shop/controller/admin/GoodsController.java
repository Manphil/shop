package com.neu.shop.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.shop.pojo.*;
import com.neu.shop.service.CateService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by 文辉 on 2017/7/19.
 */

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/showjson")
    @ResponseBody
    public Msg getAllGoods(@RequestParam(value = "page",defaultValue = "1") Integer pn, HttpServletResponse response, Model model) {
        //一页显示几个数据
        PageHelper.startPage(pn, 10);

        List<Goods> employees = goodsService.selectByExample(new GoodsExample());

        //显示几个页号
        PageInfo page = new PageInfo(employees,5);

        model.addAttribute("pageInfo", page);

        return Msg.success("查询成功!").add("pageInfo", page);
    }



    @RequestMapping("/show")
    public String goodsManage(@RequestParam(value = "page",defaultValue = "1") Integer pn, HttpServletResponse response, Model model) throws IOException {

        /*//一页显示几个数据
        PageHelper.startPage(pn, 10);

        List<Goods> employees = goodsService.selectByExample(new GoodsExample());

        //显示几个页号
        PageInfo page = new PageInfo(employees,5);

        model.addAttribute("pageInfo", page);*/

        return "adminAllGoods";
    }

    @RequestMapping("/add")
    public String showAdd(@ModelAttribute("succeseMsg") String msg, Model model) {

        if(!msg.equals("")) {
            model.addAttribute("msg", msg);
        }

        //还需要查询分类传给addGoods页面
        return "addGoods";
    }

    @RequestMapping(value = "/delete/{goodsid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteGoods(@PathVariable("goodsid")Integer goodsid) {
        goodsService.deleteGoodsById(goodsid);
        return Msg.success("删除成功!");
    }

    @RequestMapping("/addGoodsSuccess")
    public String addGoods(Goods goods,
                           @RequestParam MultipartFile[] fileToUpload,
                           HttpServletRequest request,
                           HttpServletResponse response,
                           RedirectAttributes redirectAttributes) throws IOException {

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

        redirectAttributes.addFlashAttribute("succeseMsg","商品添加成功!");

        return "redirect:/admin/goods/add";
    }

    @RequestMapping("/addCategory")
    public String addcategory(@ModelAttribute("succeseMsg") String msg, Model model) {

        if(!msg.equals("")) {
            model.addAttribute("msg", msg);
        }
        return "addCategory";
    }

    @Autowired
    private CateService cateService;

    @RequestMapping("/addCategoryResult")
    public String addCategoryResult(Category category,Model addCategoryResult,RedirectAttributes redirectAttributes){
        List<Category> categoryList=new ArrayList<>();
        CategoryExample categoryExample=new CategoryExample();
        categoryExample.or().andCatenameEqualTo(category.getCatename());
        categoryList=cateService.selectByExample(categoryExample);
        if (!categoryList.isEmpty())
        {
            addCategoryResult.addAttribute("errorMsg","分类已存在");
            return "addCategory";
        }
        else {
            cateService.insertSelective(category);
            redirectAttributes.addFlashAttribute("succeseMsg","分类添加成功!");
            return "redirect:/admin/goods/addCategory";
        }
    }

    @RequestMapping("/test")
    public String test(Model test){
        CategoryExample categoryExample=new CategoryExample();
        categoryExample.or();
        List<Category> categoryList=new ArrayList<>();
        categoryList=cateService.selectByExample(categoryExample);
       Iterator it=categoryList.iterator();
        List<String> categoryNameList=new ArrayList<>();
        while (it.hasNext())
        test.addAttribute("categoryList",categoryList);
        return "test";
    }

}
