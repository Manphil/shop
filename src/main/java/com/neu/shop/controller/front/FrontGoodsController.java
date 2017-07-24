package com.neu.shop.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 文辉 on 2017/7/24.
 */
@Controller
public class FrontGoodsController {

    @RequestMapping("/detail")
    public String detailGoods() {
        return "detail";
    }
}
