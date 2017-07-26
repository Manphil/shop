package com.neu.shop.service;

import com.neu.shop.pojo.*;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/25.
 */
public interface OrderService {
    public void insertOrder(Order order);

    public void deleteById(Integer orderid);

    public void insertOrderItem(OrderItem orderItem);

    public List<Order> selectOrderByExample(OrderExample orderExample);

    public List<OrderItem> getOrderItemByExample(OrderItemExample orderItemExample);

    public Address getAddressByKey(Integer addressid);

    public void updateOrderByKey(Order order);
}
