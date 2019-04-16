package com.bjfu.sentimentanalysis.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
    private Logger log = LoggerFactory.getLogger(IndexController.class);

    @GetMapping("/index")
    String toindex()
    {
        log.info("request for /index");
        return "index";
    }

    @GetMapping("/")
    String toindexd()
    {
        log.info("request for / for /index");
        return "index";
    }

}