package com.neu.shop.service.impl;

import com.neu.shop.dao.OrderItemMapper;
import com.neu.shop.dao.OrderMapper;
import com.neu.shop.pojo.Order;
import com.neu.shop.pojo.OrderExample;
import com.neu.shop.pojo.OrderItem;
import com.neu.shop.pojo.OrderItemExample;
import com.neu.shop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/25.
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired(required = false)
    private OrderMapper orderMapper;

    @Autowired(required = false)
    private OrderItemMapper orderItemMapper;

    @Override
    public void insertOrder(Order order) {
        orderMapper.insertSelective(order);
    }

    @Override
    public void deleteById(Integer orderid) {
        orderMapper.deleteByPrimaryKey(orderid);
    }

    @Override
    public void insertOrderItem(OrderItem orderItem) {
        orderItemMapper.insertSelective(orderItem);
    }

    @Override
    public List<Order> selectOrderByExample(OrderExample orderExample) {
        return orderMapper.selectByExample(orderExample);
    }

    @Override
    public List<OrderItem> getOrderItemByExample(OrderItemExample orderItemExample) {
        return orderItemMapper.selectByExample(orderItemExample);
    }
}
