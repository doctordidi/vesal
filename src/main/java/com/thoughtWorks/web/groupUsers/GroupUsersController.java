package com.thoughtWorks.web.groupUsers;

import com.thoughtWorks.common.ServerResponse;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Custom;
import com.thoughtWorks.service.GroupUsersService;
import com.thoughtWorks.util.PageUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/back/groupUsers")
public class GroupUsersController {

    @Autowired
    private GroupUsersService groupUsersService;


    @RequestMapping()
    public String index() {
        return "/groupUser/list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse<Map<String,Object>> list(PageUtil pageUtil) {
        Map<String, Object> data = new HashMap<>();
        ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        List<Map<String, Object>> accountInfo = groupUsersService.selectAccount(pageUtil, user.getUserName());
        data.put("accountInfo", accountInfo);
        data.put("page", pageUtil);

        return ServerResponse.createBySuccess(data);
    }

    @RequestMapping("/deleteAccount")
    @ResponseBody
    public ServerResponse<String> addAccount(Integer id, HttpServletRequest request) {
        ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        return groupUsersService.deleteAccount(id);
    }

    @RequestMapping("/addAccount")
    @ResponseBody
    public ServerResponse<String> addAccount(Integer userNumber, Custom custom, HttpServletRequest request) {
        ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        return groupUsersService.addAccount(userNumber,custom,request,user.getUserName());
    }
}
