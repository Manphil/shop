package com.neu.shop.service;

import com.neu.shop.pojo.Activity;
import com.neu.shop.pojo.ActivityExample;
import com.neu.shop.pojo.Goods;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/27.
 */
public interface ActivityService {
    List<Activity> getAllActivity(ActivityExample activityExample);

    void insertActivitySelective(Activity activity);

    Activity selectByKey(Integer activityid);

    void deleteByActivityId(Integer activityid);

//    void updateGoodsActSelective(Goods goods);
}
