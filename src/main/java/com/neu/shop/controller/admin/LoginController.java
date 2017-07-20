package com.neu.shop.controller.admin;

import com.neu.shop.pojo.Admin;
import com.neu.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 文辉 on 2017/7/19.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String adminLogin() {
        return "adminLogin";
    }

    @RequestMapping("/confirmLogin")
    public String confirmLogin(Admin admin, Model model, HttpServletRequest request) {
        Admin selectAdmin =  adminService.selectByName(admin);
        if(selectAdmin == null) {
            model.addAttribute("errorMsg","用户名或密码错误");
            return "adminLogin";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("admin",selectAdmin);
            return "redirect:/admin/index";
        }
    }

    @RequestMapping("/index")
    public String showAdminIndex() {
        return "addGoods";
    }
}
