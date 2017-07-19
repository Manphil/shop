package com.neu.shop.service.impl;

import com.neu.shop.dao.AdminMapper;
import com.neu.shop.pojo.Admin;
import com.neu.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 文辉 on 2017/7/19.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired(required = false)
    private AdminMapper adminMapper;

    @Override
    public Admin selectByName(Admin admin) {
        return adminMapper.selectByName(admin);
    }
}
