package com.neu.shop.controller.user;

import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    public ModelAndView register(){
        ModelAndView register=new ModelAndView();
        register.setViewName("register");
        return register;
    }

    @RequestMapping("/registerresult")
    public ModelAndView registerResult(User user){
        Date RegTime=new Date();
        user.setRegtime(RegTime);
        userService.insert(user);
        ModelAndView registerResult=new ModelAndView();
        registerResult.setViewName("login");
        return  registerResult;
    }

}
