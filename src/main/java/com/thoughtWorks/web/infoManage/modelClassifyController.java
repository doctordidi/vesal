package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author 马欢欢
 * @date 2017/12/20
 */
@Component
@RequestMapping("/back/modelClassify")
public class modelClassifyController {

    @RequestMapping()
    public String index() {
        return "classify/classify";
    }
}
