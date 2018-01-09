package com.thoughtWorks.web.modelInterface;

import com.thoughtWorks.service.ModelInterfaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.List;


/**
 * @author 马欢欢
 * @date 2017/12/20
 */
@Controller
@RequestMapping("/interface")
public class ModelInterface {
    @Autowired
    private ModelInterfaceService modelInterfaceService;

    @RequestMapping()
    @ResponseBody
    public Map<String, Object> modelInterface(String model) {
        Map<String, Object> map = new HashMap<>();
        int count = countStringIncludeChar(model, "-");
        String[] modelName = model.split("-");
        try {
            List<Map<String, Object>> list = modelInterfaceService.modelInterface(modelName);
            map.put("items", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    public int countStringIncludeChar(String str, String ch) {
        int count = str.length() - str.replaceAll(ch, "").length();
        return count;
    }
}
