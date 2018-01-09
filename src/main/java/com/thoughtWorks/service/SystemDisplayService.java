package com.thoughtWorks.service;

import com.thoughtWorks.entity.Level;
import java.util.List;
import java.util.Map;


/**
 * @author ubuntu
 */
public interface SystemDisplayService {

    /**
     * 根据级别查找各菜单信息查询
     * @param level 级别信息和用户信息
     * @return 模型的信息
     * @throws Exception
     */
    List<Map<String,Object>> systemInfo(Level level) throws Exception;

    /**
     * 模型菜单所有类别
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuClassify()throws Exception;
    /**
     * 第一级别菜单
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuAClassify()throws Exception;
    /**
     * 第二级别菜单
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelMenuBClassify(int b_aid)throws Exception;
    /**
     * 第三级别菜单
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
