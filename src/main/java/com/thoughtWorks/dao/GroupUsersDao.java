package com.thoughtWorks.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GroupUsersDao {


    void addAccount(@Param("userInfo") List<Map<String, String>> userInfo);

    List<Map<String,Object>> selectAccount(@Param("data") Map<String, Object> data);

    Long selectAccountTotalSize(String userName);

    int checkPrefix(@Param("checkInfo") Map<String, Object> checkInfo);

    void deleteAccount(Integer id);
}
