package com.neu.shop.service.impl;

import com.neu.shop.dao.ChatMapper;
import com.neu.shop.pojo.Chat;
import com.neu.shop.pojo.ChatExample;
import com.neu.shop.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/26.
 */
@Service("chatService")
public class ChatServiceImpl implements ChatService {

    @Autowired(required = false)
    ChatMapper chatMapper;

    @Override
    public void insertChatSelective(Chat chat) {
        chatMapper.insertSelective(chat);
    }

    @Override
    public List<Chat> selectChatByExample(ChatExample chatExample) {
        return chatMapper.selectByExample(chatExample);
    }
}
