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
        return "login";
    }

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/registerresult")
    public String registerResult(User user,Model registerResult){
        List<User> userList=new ArrayList<>();
        UserExample userExample=new UserExample();
        userExample.or().andUsernameLike(user.getUsername());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            registerResult.addAttribute("errorMsg","用户名被占用");
            return "register";
        }
        else {
            Date RegTime=new Date();
            user.setRegtime(RegTime);
            userService.insertSelective(user);
            return  "redirect:/login";
        }
    }


    @RequestMapping("/loginconfirm")
    public String loginConfirm(User user, HttpServletRequest request,Model loginResult,@RequestParam("confirmlogo") String confirmlogo){

        HttpSession session=request.getSession();
        String verificationCode = (String) session.getAttribute("certCode");
        if (!confirmlogo.equals(verificationCode))
        {
            loginResult.addAttribute("errorMsg","验证码错误");
            return "login";

        }
        List<User> userList=new ArrayList<User>();
        UserExample userExample=new UserExample();
        userExample.or().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
        userList=userService.selectByExample(userExample);
        if (!userList.isEmpty())
        {
            session.setAttribute("user",userList.get(0));
            return "redirect:/main";
        }
        else {
            loginResult.addAttribute("errorMsg","用户名与密码不匹配");
            return "login";
        }
    }
}
