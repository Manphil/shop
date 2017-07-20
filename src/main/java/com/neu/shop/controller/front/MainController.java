package com.neu.shop.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 文辉 on 2017/7/18.
 */
@Controller
public class MainController {

    @RequestMapping("/main")
    public String showAllGoods() {
        return "main";
    }
}
