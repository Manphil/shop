package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.ChatService;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 文辉 on 2017/7/26.
 */
@Controller
public class ChatController {

    @Autowired
    ChatService chatService;

    @Autowired
    UserService userService;

    @RequestMapping("/chat")
    public String showChat(HttpSession session, Model model) {
        //查询历史消息聊天对象
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/shop/login";
        }
        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(user.getUserid());
//        chatExample.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList1 = chatService.selectChatByExample(chatExample);

        ChatExample chatExample2 = new ChatExample();
//        chatExample.or().andReceiveuserEqualTo(user.getUserid());
        chatExample2.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList2 = chatService.selectChatByExample(chatExample2);

        //获取userid列表
        List<Integer> useridList = new ArrayList<>();
        for (Chat chat : chatList1) {
            useridList.add(chat.getSenduser());
        }
        for (Chat chat : chatList2) {
            useridList.add(chat.getReceiveuser());
        }

        //获取用户信息
        UserExample userExample = new UserExample();
        userExample.or().andUseridIn(useridList);
        List<User> userList = userService.selectByExample(userExample);
        model.addAttribute("chatuserlist", userList);

        return "chat";
    }

    @RequestMapping("/getMessage")
    @ResponseBody
    public Msg getMessageInfo(Integer senduser, Integer receiveuser) {

        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(senduser).andSenduserEqualTo(receiveuser);
        chatExample.or().andSenduserEqualTo(senduser).andReceiveuserEqualTo(receiveuser);
        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList = chatService.selectChatByExample(chatExample);

        return Msg.success("获取消息成功").add("message", chatList);
    }

    @RequestMapping("/frontchat")
    public String frontChat() {
        return "frontChat";
    }

    @RequestMapping("/adminchat")
    public String adminChat(HttpSession session, Model model) {

        //查询历史消息聊天对象
        /*User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/shop/login";
        }*/
        Integer userid = 5;
        ChatExample chatExample = new ChatExample();
        chatExample.or().andReceiveuserEqualTo(userid);
//        chatExample.or().andSenduserEqualTo(user.getUserid());
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList1 = chatService.selectChatByExample(chatExample);

        ChatExample chatExample2 = new ChatExample();
//        chatExample.or().andReceiveuserEqualTo(user.getUserid());
        chatExample2.or().andSenduserEqualTo(userid);
//        chatExample.setOrderByClause("MsgTime asc");
        List<Chat> chatList2 = chatService.selectChatByExample(chatExample2);

        //获取userid列表
        List<Integer> useridList = new ArrayList<>();
        for (Chat chat : chatList1) {
            useridList.add(chat.getSenduser());
        }
        for (Chat chat : chatList2) {
            useridList.add(chat.getReceiveuser());
        }

        //获取用户信息
        UserExample userExample = new UserExample();
        userExample.or().andUseridIn(useridList);
        List<User> userList = userService.selectByExample(userExample);
        model.addAttribute("chatuserlist", userList);
        return "adminChat";
    }

    @RequestMapping("/sendMessage")
    @ResponseBody
    public Msg saveMessage(Chat chat) {
        System.out.println(chat.getMsgcontent());
        chat.setMsgtime(new Date());
        chatService.insertChatSelective(chat);
        return Msg.success("保存成功");
    }
}
