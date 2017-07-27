package com.neu.shop.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.shop.pojo.Activity;
import com.neu.shop.pojo.ActivityExample;
import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.GoodsExample;
import com.neu.shop.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/27.
 */
@Controller
@RequestMapping("/admin/activity")
public class ActivityController {

    @Autowired(required = false)
    ActivityService activityService;

    @RequestMapping("/show")
    public String showActivity(@RequestParam(value = "page",defaultValue = "1") Integer pn, Model model) {

        //一页显示几个数据
        PageHelper.startPage(pn, 10);

        ActivityExample activityExample = new ActivityExample();
        activityExample.or();

        List<Activity> activityList = activityService.getAllActivity(activityExample);

        //显示几个页号
        PageInfo page = new PageInfo(activityList,5);
        model.addAttribute("pageInfo", page);

        return "activity";
    }
}
