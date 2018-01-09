package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classify;

import java.util.List;
import java.util.Map;

/**
 * @author ubuntu
 */
public interface    ModelInterfaceDao {

    /**
     * 查询二级菜单
     * @param classify
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> aClassify(Classify classify) throws Exception;

    /**
     * 查询三级菜单
     *
     * @param classify
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> bClassify(Classify classify) throws Exception;

    /**
     * 查询模型信息
     * @param classify
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> modelAll(Classify classify) throws Exception;
}
