package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.SystemDisplayDao;
import com.thoughtWorks.entity.Level;
import com.thoughtWorks.entity.Model;
import com.thoughtWorks.service.SystemDisplayService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author 马欢欢
 * @date 2017/12/15
 */
@Service
public class SystemDisplayServiceImpl implements SystemDisplayService {

    @Resource
    private SystemDisplayDao systemDisplayDao;

    @Override
    public List<Map<String, Object>> systemInfo(Level level) throws Exception {
        List<Map<String, Object>> data = systemDisplayDao.systemInfo(level);
        return data;
    }

    @Override
    public List<Map<String, Object>> modelMenuClassify() throws Exception {
        //一级菜单
        List<Map<String, Object>> aClassify = systemDisplayDao.modelMenuAClassify();
        for (Map<String, Object> aClassifyMap : aClassify) {
            int b_aid = Integer.valueOf(aClassifyMap.get("a_id").toString());
            //二级菜单
            List<Map<String, Object>> bClassify = systemDisplayDao.modelMenuBClassify(b_aid);
            aClassifyMap.put("BClassify", bClassify);
        }
        return aClassify;
    }

    @Override
    public List<Map<String, Object>> modelMenuAClassify() throws Exception {
        return  systemDisplayDao.modelMenuAClassify();
    }

    @Override
    public List<Map<String, Object>> modelMenuBClassify(int b_aid) throws Exception {
        return systemDisplayDao.modelMenuBClassify(b_aid);
    }

    @Override
    public List<Map<String, Object>> modelMenuCClassify(int c_bid) throws Exception {
        return systemDisplayDao.modelMenuCClassify(c_bid);
    }

    @Override
    public List<Map<String, Object>> queryModelById(Level level) throws Exception {
        return systemDisplayDao.queryModelById(level);
    }
}
