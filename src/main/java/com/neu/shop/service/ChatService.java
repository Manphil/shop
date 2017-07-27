package com.neu.shop.service;

import com.neu.shop.pojo.Chat;
import com.neu.shop.pojo.ChatExample;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/26.
 */
public interface ChatService {
    public void insertChatSelective(Chat chat);

    public List<Chat> selectChatByExample(ChatExample chatExample);
}
