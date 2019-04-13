package com.bjfu.sentimentanalysis.demo.controller;


import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import kong.unirest.UnirestException;
import org.json.JSONArray;
import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;

@RestController
//@RequestMapping("/data")
public class DataController {
    private Logger log = LoggerFactory.getLogger(DataController.class);
    String[] URLS={"","?auto","?kitchen","?food","?news","?weibo"};
    public static final String SENTIMENT_URL = "http://api.bosonnlp.com/sentiment/analysis";

    @PostMapping("/data/analy")
    public HashMap<String ,Object> ss(@RequestParam String message,@RequestParam Integer type) throws JSONException, UnirestException,
            java.io.IOException {
        log.info("message: " + message);
//        Enumeration<String> paraNames = request.getParameterNames();
//        for (Enumeration e = paraNames; e.hasMoreElements(); ) {
//            String thisName = e.nextElement().toString();
//            String thisValue = request.getParameter(thisName);
//            log.info(thisName + "--------------" + thisValue);
//
//        }
//        log.info("message: " + request.getParameterNames());

        String body = new JSONArray(new String[]{message}).toString();
//        log.info("body  :  " + body);
//        String body = message;
        HttpResponse<JsonNode> jsonResponse = Unirest.post(SENTIMENT_URL+URLS[type])
                .header("Accept", "application/json")
                .header("X-Token", "dfRKQEfX.33618.MrvbkXnf7-6I")
                .body(body)
                .asJson();
        log.info(jsonResponse.getBody().toString());
        Unirest.shutDown();
        String []strings=jsonResponse.getBody().toString().split(",");
        strings[0]=strings[0].substring(2);
        strings[1]=strings[1].substring(0,strings[1].length()-2);
//        for (String s:strings)
//        {
//            log.info(s);
//        }
        Unirest.shutDown();
        HashMap<String ,Object>sol=new HashMap<>();
        sol.put("result",new double[]{Double.valueOf(strings[0]),Double.valueOf(strings[1])});
        return sol;
    }

    @GetMapping("/data/anal")
    public HashMap<String ,Object> sds(HttpServletRequest request ,@RequestParam String message) throws JSONException, UnirestException,
            java.io.IOException {
        log.info("message: " + message);
        String body = new JSONArray(new String[]{message}).toString();
        HttpResponse<JsonNode> jsonResponse = Unirest.post(SENTIMENT_URL)
                .header("Accept", "application/json")
                .header("X-Token", "dfRKQEfX.33618.MrvbkXnf7-6I")
                .body(body)
                .asJson();
        log.info(jsonResponse.getBody().toString());
        String []strings=jsonResponse.getBody().toString().split(",");
        strings[0]=strings[0].substring(2);
        strings[1]=strings[1].substring(0,strings[1].length()-2);
//        for (String s:strings)
//        {
//            log.info(s);
//        }
        Unirest.shutDown();
        HashMap<String ,Object>sol=new HashMap<>();
        sol.put("result",new double[]{Double.valueOf(strings[0]),Double.valueOf(strings[1])});
        return sol;
    }
}
