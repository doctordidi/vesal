package com.thoughtWorks.service.impl;

import com.thoughtWorks.common.ServerResponse;
import com.thoughtWorks.dao.GroupUsersDao;
import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.service.GroupUsersService;
import com.thoughtWorks.util.MD5Util;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class GroupUsersServiceImpl implements GroupUsersService {

    @Autowired
    GroupUsersDao groupUsersDao;

    @Override
    public ServerResponse<String> addAccount(Integer userNumber, Custom custom, HttpServletRequest request, String userName) {
        Map<String, Object> checkInfo = new HashMap<>();
        checkInfo.put("parentAccount", userName);
        checkInfo.put("prefix", custom.getGroupUserPrefix());

        int prefixNameIsRepeated = groupUsersDao.checkPrefix(checkInfo);
        if (prefixNameIsRepeated != 0) {
            return ServerResponse.createByErrorMessage("该前缀名以存在，请换一个！！！");
        }
        List<Map<String, String>> userInfo = new ArrayList<>();
        for (int i = 0; i < userNumber; i++) {
            Map<String, String> data = new HashMap<>();
            String name = custom.getGroupUserPrefix() + ((Math.random() * 9 + 1) * 100000);

            data.put("name", name.split("\\.")[0] + i);
            data.put("pwd", MD5Util.MD5EncodeUtf8("123456"));
            data.put("groupUserPrefix", custom.getGroupUserPrefix());
            data.put("cPhone", custom.getcPhone());
            data.put("cEmail", custom.getcEmail());
            data.put("parentAccount", custom.getParentAccount());
            data.put("adminName", userName);

            userInfo.add(data);
        }

        try {
            groupUsersDao.addAccount(userInfo);
            return ServerResponse.createBySuccessMessage("更新成功！！！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ServerResponse.createByErrorMessage("更新失败！！！");
    }

    @Override
    public List<Map<String, Object>> selectAccount(PageUtil pageUtil, String userName) {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("size", pageUtil.getPageSize());
        data.put("adminName", userName);

        pageUtil.setTotalSize(groupUsersDao.selectAccountTotalSize(userName));

        return groupUsersDao.selectAccount(data);
    }

    @Override
    public ServerResponse<String> deleteAccount(Integer id) {
        try {
            groupUsersDao.deleteAccount(id);

            return ServerResponse.createBySuccessMessage("删除数据成功！！！");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ServerResponse.createByErrorMessage("删除数据失败！！！");
    }

}
