package com.thoughtWorks.service;

import com.thoughtWorks.common.ServerResponse;
import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.util.PageUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface GroupUsersService {

    List<Map<String, Object>> selectAccount(PageUtil pageUtil, String userName);

    ServerResponse<String> deleteAccount(Integer id);

    ServerResponse<String> addAccount(Integer userNumber,Custom custom, HttpServletRequest request, String userName);
}
