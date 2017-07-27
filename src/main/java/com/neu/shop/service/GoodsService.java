package com.neu.shop.service;

import com.neu.shop.pojo.*;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/19.
 */

public interface GoodsService {
    public Integer addGoods(Goods goods);

    public void addImagePath(ImagePath imagePath);

    public List<Goods> selectByExample(GoodsExample example);

    public void deleteGoodsById(Integer goodsid);

    public void updateGoodsById(Goods goods);

    public List<ImagePath> findImagePath(Integer goodsid);

    public Goods selectById(Integer goodsid);

    public List<Goods> selectByExampleLimit(GoodsExample digGoodsExample);

    public void addFavorite(Favorite favorite);

    public Favorite selectFavByKey(FavoriteKey favoriteKey);

    public void deleteFavByKey(FavoriteKey favoriteKey);

    public List<Favorite> selectFavByExample(FavoriteExample favoriteExample);
}
