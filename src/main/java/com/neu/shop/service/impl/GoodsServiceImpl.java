package com.neu.shop.service.impl;

import com.neu.shop.dao.GoodsMapper;
import com.neu.shop.pojo.Goods;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 文辉 on 2017/7/19.
 */

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Autowired(required = false)
    GoodsMapper goodsMapper;

    @Override
    public void addGoods(Goods goods) {
        goodsMapper.insertSelective(goods);
    }
}
