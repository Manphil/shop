package com.neu.shop.service.impl;

import com.neu.shop.dao.ActivityMapper;
import com.neu.shop.pojo.Activity;
import com.neu.shop.pojo.ActivityExample;
import com.neu.shop.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/27.
 */
public class ActivityServiceImpl implements ActivityService {

    @Autowired(required = false)
    ActivityMapper activityMapper;

    public List<Activity> getAllActivity(ActivityExample activityExample) {
        return activityMapper.selectByExample(activityExample);
    }
}
