package com.neu.shop.service.impl;

import com.neu.shop.dao.AddressMapper;
import com.neu.shop.pojo.Address;
import com.neu.shop.pojo.AddressExample;
import com.neu.shop.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/25.
 */
@Service("addressService")
public class AddressServiceImpl implements AddressService {

    @Autowired(required = false)
    private AddressMapper addressMapper;

    @Override
    public List<Address> getAllAddressByExample(AddressExample addressExample) {
        return addressMapper.selectByExample(addressExample);
    }
}
