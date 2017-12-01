package top.zywork.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by chenfeilong on 2017/11/21.
 */
@Controller
@RequestMapping("test")
public class test {

    @RequestMapping("test")
    public ModelAndView t(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("test");
        modelAndView.addObject("test","1");
        return  modelAndView;
    }
}
