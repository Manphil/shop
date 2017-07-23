package com.neu.shop.service;

import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.GoodsExample;
import com.neu.shop.pojo.ImagePath;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/19.
 */

public interface GoodsService {
    public Integer addGoods(Goods goods);

    public void addImagePath(ImagePath imagePath);

    public List<Goods> selectByExample(GoodsExample example);

    public void deleteGoodsById(Integer goodsid);

}
