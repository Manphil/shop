package com.neu.shop.controller.user;

import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 蒋松冬 on 2017/7/22.
 */
@Controller
@RequestMapping("/user")
public class userLoginController {

    @RequestMapping("/login")
    public ModelAndView loginView(){
        ModelAndView loginView=new ModelAndView();
        loginView.setViewName("login");
        return loginView;
    }

    @Autowired
    private UserService userService;
    @RequestMapping("/loginconfirm")
    public ModelAndView loginConfirm(User user, HttpServletRequest request, @RequestParam String confirmlogo){
        HttpSession session=request.getSession();
        String verificationCode = (String) session.getAttribute("certCode");
        List<User> userList=new ArrayList<User>();
        ModelAndView loginResult=new ModelAndView();
        UserExample userExample=new UserExample();
        userExample.or().andUseridEqualTo(user.getUserid()).andPasswordEqualTo(user.getPassword());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            if (confirmlogo.equals(verificationCode))
            {
                loginResult.setViewName("main");
                return loginResult;
            }
            else {
                loginResult.addObject("errorMsg","验证码错误");
                loginResult.setViewName("login");
                return loginResult;
            }
        }
        else {
            loginResult.addObject("errorMsg","学号与密码不匹配");
            loginResult.setViewName("login");
            return loginResult;
        }
    }
}
