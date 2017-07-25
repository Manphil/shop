package com.neu.shop.controller.front;

import com.neu.shop.pojo.Msg;
import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    public String loginConfirm(User user,Model loginResult,HttpServletRequest request,@RequestParam("confirmlogo") String confirmlogo){
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

    @RequestMapping("/information")
    public String information(Model userModel,HttpServletRequest request){
        HttpSession session=request.getSession();
        User user;
        Integer userId;
        user=(User) session.getAttribute("user");
        userId=user.getUserid();
        user=userService.selectByPrimaryKey(userId);
        userModel.addAttribute("user",user);
        return "information";
    }

    @RequestMapping("/saveInfo")
    @ResponseBody
    public Msg saveInfo(String name, String email, String telephone,HttpServletRequest request){
        HttpSession session=request.getSession();
        UserExample userExample=new UserExample();
        User user,updateUser=new User();
        List<User> userList=new ArrayList<>();
        Integer userid;
        user=(User)session.getAttribute("user");
        userid= user.getUserid();
        userExample.or().andUsernameEqualTo(name);
        userList=userService.selectByExample(userExample);
        if (userList.isEmpty())
        {
            updateUser.setUserid(userid);
            updateUser.setUsername(name);
            updateUser.setEmail(email);
            updateUser.setTelephone(telephone);
            userService.updateByPrimaryKeySelective(updateUser);
            return Msg.success("更新成功");
        }
        else  {return Msg.fail("更新失败");}
    }
}
