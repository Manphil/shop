package com.neu.shop.controller.front;

import com.neu.shop.pojo.User;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Created by 蒋松冬 on 2017/7/22.
 */
@Controller
@RequestMapping("/user")
public class registerController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/registerresult")
    public String registerResult(User user){
        Date RegTime=new Date();
        user.setRegtime(RegTime);
        userService.insert(user);
        return  "redirect:/user/login";
    }

}
