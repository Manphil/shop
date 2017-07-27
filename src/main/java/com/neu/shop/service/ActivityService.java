package com.neu.shop.service;

import com.neu.shop.pojo.Activity;
import com.neu.shop.pojo.ActivityExample;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/27.
 */
public interface ActivityService {
    public List<Activity> getAllActivity(ActivityExample activityExample);
}
