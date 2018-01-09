package com.thoughtWorks.common;

/**
 * @author ubuntu
 */
public class Constant {
    public static final String CURRENT_USER = "custom";
    public static final String EMAIL = "email";
    public static final String USERNAME = "username";

    public interface Role{
        int ROLE_CUSTOMER = 0; //普通用户
        int ROLE_ADMIN = 1; //管理员
    }

    public interface ValidType{
        String USERNAME = "username";
        String EMAIL = "email";
    }

    public static final String SEARCH_SUCCESS = "查询成功";
    public static final String SEARCH_FAILURE = "查询失败";
    public static final String ACCOUNT_NOT_EXIST = "帐号不存在";
    public static final String ACCOUNT_OR_PWD_ERROR = "帐号或密码错误";


    public static final String ADD_SUCCESS = "添加成功";
    public static final String ADD_FAILURE = "添加失败";
    public static final String UPDATE_SUCCESS = "修改成功";
    public static final String UPDATE_FAILURE = "修改失败";
    public static final String ACCOUNT_IS_LOCK = "当前帐号或角色被禁止";
    public static final String DELETE_SUCCESS = "删除成功";
    public static final String DELETE_FAILURE= "删除失败";
    public static final String OPERATION_FAILURE = "操作失败";
    public static final String OPERATION_SUCCESS = "操作成功";

    public static final String UPLOAD_FAILURE = "上传失败";
    public static final String UPLOAD_SUCCESS = "上传成功";
    public static final String TEMP_IMAGE_PATH = "/temp/";
    public static final String USER_IMAGE_PATH = "/user/";

    public static final String SHORT_TIME_PATTERN = "yyyy-MM-dd";
    public static final String ACCOUNT_IS_EXIST = "帐号已存在";
    public static int ADMIN_ROLE_ID = 1;

    public static final String LOGIN_OUT = "注销成功";
    public static final String SUBSCRIBE_SUCCESS = "订阅成功";
    public static final String SUBSCRIBE_FAILURE = "取消订阅";

    public static final String EMAIL_SUCCESS = "邮件发送成功";
    public static final String EMAIL_FAILUER = "邮件发送失败";
    public static final String EMAIL_HAVE = "邮箱已存在";
}