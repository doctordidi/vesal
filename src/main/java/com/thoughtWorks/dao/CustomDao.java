package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.entity.Subscribe;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author ubuntu
 */
public interface CustomDao{

    /**
     * 客户登录
     * @param custom
     * @return
     */
    Custom login(Custom custom) throws Exception;

    /**
     * 取消订阅
     * @param subscribe
     * @throws Exception
     */
    void deleteSubscribe(Subscribe subscribe)throws Exception;

    /**
     * 添加订阅
     * @param subscribe 添加订阅信息
     * @throws Exception
     */
    void addSubscribe(Subscribe subscribe)throws Exception;

    /**
     *
     * 查找个人订阅信息
     * @param custom 个人信息：ID
     * @return 个人订阅的信息
     * @throws Exception
     */
    List<Map<String,Object>> personalSubscription (Custom custom)throws Exception;

    /**
     * 根据用户名查找信息
     * @param cName
     * @return
     * @throws Exception
     */
    Custom queryCustomByName(String cName) throws  Exception;

    /**
     * 注册信息
     * @param custom
     * @throws Exception
     */
    void customRegister(@Param("custom") Custom custom) throws  Exception;


    /**
     * 验证手机号是否存在
     * @param cPhone
     * @return
     */
    int checkPhone(String cPhone);

    /**
     * 验证邮箱是否存在
     * @param cEmail
     * @return
     */
    int checkEmail(String cEmail);
}
