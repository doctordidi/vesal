package com.thoughtWorks.service;

import java.util.Map;
import java.util.List;

/**
 * @author ubuntu
 */
public interface ModelInterfaceService {

    /**
     * 查询信息
     * @return
     * @throws Exception
     */
    List<Map<String, Object>> modelInterface(String[] modelInterface) throws Exception;
}
