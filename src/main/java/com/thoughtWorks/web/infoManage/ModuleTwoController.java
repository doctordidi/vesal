package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author ubuntu
 */
@Component
@RequestMapping("/back/moduleTwo")
public class ModuleTwoController {

    @RequestMapping()
    public String index() {
        return "moduleTwo/moduleTwo/moduleTwo";
    }
}
