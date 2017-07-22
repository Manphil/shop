package com.neu.shop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 文辉 on 2017/7/22.
 */
@Controller
@RequestMapping("/admin")
public class UserController {

    @RequestMapping("/user")
    public String userManage() {
        return "userManage";
    }
}
