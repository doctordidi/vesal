package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Level;
import com.thoughtWorks.entity.Model;

import java.util.List;
import java.util.Map;

/**
 *
 * @author 马欢欢
 * @date 2017/12/15
 */
public interface SystemDisplayDao {

    /**
     * 系统解剖各菜单信息查询
     * @param level
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> systemInfo(Level level) throws Exception;

    /**
     * 一级模型菜单类别
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuAClassify()throws Exception;
    /**
     * 二级模型菜单类别
     *  @param b_aid
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuBClassify(int b_aid)throws Exception;

    /**
     * 三级模型菜单类别
     * @param c_bid
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuCClassify(int c_bid)throws Exception;

    /**
     *根据id查找模型信息
     * @param  level
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> queryModelById(Level level)throws Exception;
}
