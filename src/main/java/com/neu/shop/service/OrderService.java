package com.neu.shop.service;

import com.neu.shop.pojo.Order;
import com.neu.shop.pojo.OrderExample;
import com.neu.shop.pojo.OrderItem;
import com.neu.shop.pojo.OrderItemExample;

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
}
