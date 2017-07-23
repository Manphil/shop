package com.neu.shop.service;

import com.neu.shop.pojo.Category;
import com.neu.shop.pojo.CategoryExample;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/23.
 */
public interface CateService {
    public List<Category> selectByExample(CategoryExample example);
}
