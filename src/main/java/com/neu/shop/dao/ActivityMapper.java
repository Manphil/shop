package com.neu.shop.dao;

import com.neu.shop.pojo.Activity;
import com.neu.shop.pojo.ActivityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ActivityMapper {
    long countByExample(ActivityExample example);

    int deleteByExample(ActivityExample example);

    int deleteByPrimaryKey(Integer activityid);

    int insert(Activity record);

    int insertSelective(Activity record);

    List<Activity> selectByExample(ActivityExample example);

    Activity selectByPrimaryKey(Integer activityid);

    int updateByExampleSelective(@Param("record") Activity record, @Param("example") ActivityExample example);

    int updateByExample(@Param("record") Activity record, @Param("example") ActivityExample example);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);
}