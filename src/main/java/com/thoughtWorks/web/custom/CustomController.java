package com.thoughtWorks.web.custom;

import com.thoughtWorks.common.Constant;
import com.thoughtWorks.common.ServerResponse;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.entity.Subscribe;
import com.thoughtWorks.service.CustomService;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author ubuntu
 */
@Controller
@RequestMapping("/CustomLogin")
public class CustomController {
    @Autowired
    private CustomService customService;

    /**
     * 用户登录
     * @param custom
     * @return
     */
    @RequestMapping(value = "login")
    @ResponseBody
    private ServerResponse<Custom> login(Custom custom, HttpSession session) {
        try {
            ServerResponse<Custom> response = customService.login(custom);
            if (response.isSuccess()) {
                session.setAttribute(Constant.CURRENT_USER, response.getData());
            }

            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ServerResponse.createByErrorMessage("登录失败");
    }

    /**
     * 注销登录
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "loginOut")
    @ResponseBody
    private Map<String, Object> loginOut(HttpServletRequest request) {
        Map<String, Object> data = new HashMap<>();
        request.getSession().removeAttribute("custom");
        data.put("result", true);
        data.put("msg", Constant.LOGIN_OUT);
        return data;
    }

    /**
     * 判断是否有session
     *
     * @param session
     * @return
     */
    @RequestMapping("/session")
    @ResponseBody
    public Map<String, Object> session(HttpSession session) {
        Map<String, Object> data = new HashMap<String, Object>();
        try {
            Custom user = (Custom) session.getAttribute("custom");
            if (user != null) {
                data.put("haveSession", true);
                data.put("user", user);
            } else {
                data.put("haveSession", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

    /**
     * 订阅和取消订阅
     *
     * @param subscribe
     * @return
     */
    @RequestMapping("/Subscribe")
    @ResponseBody
    public Map<String, Object> Subscribe(Subscribe subscribe) {
        Map<String, Object> data = new HashMap<String, Object>();
        try {
            customService.subscribe(subscribe);
            data.put("result", true);
            data.put("msg", Constant.SUBSCRIBE_SUCCESS);
        } catch (Exception e) {
            data.put("msg", Constant.UPDATE_FAILURE);
            e.printStackTrace();
        }
        return data;
    }

    /**
     * 用户查找个人订阅
     *
     * @param custom
     * @return
     */
    @RequestMapping("/personal")
    @ResponseBody
    public Map<String, Object> personalSubscription(Custom custom, HttpSession session) {
        Map<String, Object> data = new HashMap<>();
        Custom user = (Custom) session.getAttribute("custom");
        try {
            custom.setcId(user.getcId());
            List<Map<String, Object>> customs = customService.personalSubscription(custom);
            data.put("customs", customs);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    /**
     * 通过姓名查找用户
     * @param cName
     * @return
     */
    @RequestMapping(value = "/queryCustomByName")
    @ResponseBody
    public Map<String, Object> queryCustomByName(String cName,String cPhone) {
        Map<String, Object> data = new HashMap<>();
        try {
            boolean customName = customService.queryCustomByName(cName);
            boolean customPhone = customService.checkPhone(cPhone);
            data.put("customName", customName);
            data.put("customPhone", customPhone);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    /**
     * 用户注册信息
     * @param custom
     * @param request
     * @return
     */

    @RequestMapping(value = "/customRegister")
    @ResponseBody
    public ServerResponse<String> customRegister(Custom custom, HttpServletRequest request) {
        try {
            String ip = getLocalIp(request);
            custom.setcIp(ip);

            return customService.customRegister(custom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ServerResponse.createByErrorMessage("注册失败！！！");
    }

    /**
     *   邮箱验证码
     */
    @RequestMapping(value = "/identifying")
    @ResponseBody
    public Map<String, Object> identifying(String cEmail) {
        Map<String, Object> data = new HashMap<>();
        try {
            boolean customEmail = customService.checkEmail(cEmail);
            if(customEmail){
                data.put("result", false);
                data.put("msg", Constant.EMAIL_HAVE);
            }else{
                //codeEmail生成6位随机数字
                StringBuffer buffer = new StringBuffer();
                Random random = new Random();
                for (int i = 0; i < 6; i++) {
                    buffer.append(random.nextInt(10));
                }
                String codeEmail = buffer.toString();

                boolean isNull = sendEmail(cEmail, codeEmail);
                if (isNull) {
                    data.put("result", true);
                    data.put("codeEmail", codeEmail);
                    data.put("msg", Constant.EMAIL_SUCCESS);
                } else {
                    data.put("result", false);
                    data.put("msg", Constant.EMAIL_FAILUER);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public static boolean sendEmail(String emailaddress, String code) {

        try {
            HtmlEmail email = new HtmlEmail();//不用更改
//          email.setHostName("smtp.163.com");//需要修改，126邮箱为smtp.126.com,163邮箱为smtp.163.com，QQ为smtp.qq.com
            email.setHostName("smtp.126.com");//需要修改，126邮箱为smtp.126.com,163邮箱为smtp.163com，QQ为smtp.qq.com
            email.setSmtpPort(25);
            email.setCharset("UTF-8");
            email.addTo(emailaddress);// 收件地址

//          email.setFrom("vesalmail@163.com", "维萨里产品展示网");//此处填邮箱地址和用户名,用户名可以任意填写
//            email.setFrom("vesalemail@126.com", "维萨里产品展示网");//此处填邮箱地址和用户名,用户名可以任意填写
            email.setFrom("xavesal@126.com", "维萨里产品展示网");//此处填邮箱地址和用户名,用户名可以任意填写

//          email.setAuthentication("vesalmail@163.com", "ThoughtWorks1234");//此处填写邮箱地址和客户端授权码
//            email.setAuthentication("vesalemail@126.com", "ThoughtWorks1234");//此处填写邮箱地址和客户端授权码
            email.setAuthentication("xavesal@126.com", "ren8565yu1");//此处填写邮箱地址和客户端授权码

            email.setSubject("消息接收邮箱验证");//此处填写邮件名，邮件名可任意填写，但需要经常改，否则会被网易拦截
            email.setMsg("【维萨里产品展示网】验证码:" + code + "，该验证码5分钟内有效。为了保证您的账户安全，请勿向他人泄露验证码信息。");//此处填写邮件内容

            email.send();
            return true;
        } catch (Exception e) {
            e.printStackTrace();

            return false;
        }
    }


    /**
     * 获取IP
     *
     * @param request
     * @return
     */
    public static String getLocalIp(HttpServletRequest request) {
        String remoteAddr = request.getRemoteAddr();
        String forwarded = request.getHeader("X-Forwarded-For");
        String realIp = request.getHeader("X-Real-IP");

        String ip = null;
        if (realIp == null) {
            if (forwarded == null) {
                ip = remoteAddr;
            } else {
                ip = remoteAddr + "/" + forwarded.split(",")[0];
            }
        } else {
            if (realIp.equals(forwarded)) {
                ip = realIp;
            } else {
                if (forwarded != null) {
                    forwarded = forwarded.split(",")[0];
                }
                ip = realIp + "/" + forwarded;
            }
        }
        return ip;
    }
}
