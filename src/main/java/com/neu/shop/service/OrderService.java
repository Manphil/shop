package com.neu.shop.service;

import com.neu.shop.pojo.Order;

/**
 * Created by 文辉 on 2017/7/25.
 */
public interface OrderService {
    public void insertOrder(Order order);

    public void deleteById(Integer orderid);

//    public void insertOrderItem(OrderItem orderItem);
}
