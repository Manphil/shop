package com.neu.shop.controller.front;

import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 蒋松冬 on 2017/7/22.
 */
@Controller
public class CustomerController {

    @RequestMapping("/login")
    public String loginView(){
        ModelAndView loginView=new ModelAndView();
        loginView.setViewName("login");
        return "login";
    }

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
        userService.insertSelective(user);
        return  "redirect:/login";
    }


    @RequestMapping("/loginconfirm")
    public String loginConfirm(User user, HttpServletRequest request,Model loginResult,@RequestParam("confirmlogo") String confirmlogo){
        HttpSession session=request.getSession();
        String verificationCode = (String) session.getAttribute("certCode");
        List<User> userList=new ArrayList<User>();
        UserExample userExample=new UserExample();
        userExample.or().andUseridEqualTo(user.getUserid()).andPasswordEqualTo(user.getPassword());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            if (confirmlogo.equals(verificationCode))
            {
                return "redirect:/main";
            }
            else {
                loginResult.addAttribute("errorMsg","验证码错误");
                return "login";
            }
        }
        else {
            loginResult.addAttribute("errorMsg","学号与密码不匹配");
            return "login";
        }
    }
}
