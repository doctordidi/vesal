package com.thoughtWorks.service.impl;

import com.thoughtWorks.common.Constant;
import com.thoughtWorks.common.ServerResponse;
import com.thoughtWorks.dao.CustomDao;
import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.entity.Subscribe;
import com.thoughtWorks.service.CustomService;
import com.thoughtWorks.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author ubuntu
 */
@Service
public class CustomServiceImpl implements CustomService {
    @Autowired
    private CustomDao customDao;

    @Override
    public ServerResponse<Custom> login(Custom custom) throws Exception {
        custom.setcPassword(MD5Util.MD5EncodeUtf8(custom.getcPassword()));
        Custom custom1 = customDao.login(custom);

        if (custom1 == null) {
            return ServerResponse.createByErrorMessage("用户名或密码错误");
        }
        custom1.setcPassword(StringUtils.EMPTY);

        return ServerResponse.createBySuccess("登录成功", custom1);
    }

    @Override
    public void subscribe(Subscribe subscribe) throws Exception {
        if (subscribe.getsWhether() == 1) {
            customDao.addSubscribe(subscribe);
        } else {
            customDao.deleteSubscribe(subscribe);
        }
    }

    @Override
    public List<Map<String, Object>> personalSubscription(Custom custom) throws Exception {
        List<Map<String, Object>> data = customDao.personalSubscription(custom);
        for (Map<String, Object> map : data) {
            String m_thumbnail = (String) map.get("m_thumbnail");
            String m_dynamic = (String) map.get("m_dynamic");
            map.put("m_thumbnail", m_thumbnail.replaceAll("\\\\", "/"));
            map.put("m_dynamic", m_dynamic.replaceAll("\\\\", "/"));
        }
        return data;
    }

    @Override
    public boolean queryCustomByName(String cName) throws Exception {
        Custom custom = customDao.queryCustomByName(cName);
        if (custom != null) {
            return true;
        }
        return false;
    }

    @Override
    public ServerResponse<String> customRegister(Custom custom) throws Exception {
        custom.setcPassword(MD5Util.MD5EncodeUtf8(custom.getcPassword()));
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        custom.setcCode(uuid);
        customDao.customRegister(custom);

        return ServerResponse.createSuccessMessageResponse("注册成功");
    }

    @Override
    public boolean checkPhone(String cPhone) {
       int resultCount = customDao.checkPhone(cPhone);
       if (resultCount > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkEmail(String cEmail) {
        int resultCount = customDao.checkEmail(cEmail);
        if (resultCount > 0) {
            return true;
        }
        return false;
    }
}