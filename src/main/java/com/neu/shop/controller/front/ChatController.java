package com.neu.shop.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 文辉 on 2017/7/26.
 */
@Controller
public class ChatController {

    @RequestMapping("/chat")
    public String showChat() {
        return "chat";
    }

    @RequestMapping("/frontchat")
    public String frontChat() {
        return "frontChat";
    }

    @RequestMapping("/adminchat")
    public String adminChat() {
        return "adminChat";
    }
}
