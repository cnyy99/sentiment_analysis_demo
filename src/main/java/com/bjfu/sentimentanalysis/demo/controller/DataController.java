package com.bjfu.sentimentanalysis.demo.controller;


import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import kong.unirest.UnirestException;
import org.json.JSONArray;
import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data")
public class DataController {
    private Logger log = LoggerFactory.getLogger(DataController.class);

    public static final String SENTIMENT_URL = "http://api.bosonnlp.com/sentiment/analysis";

    @RequestMapping("/analy")
    public String ss(@RequestParam String message) throws JSONException, UnirestException,
            java.io.IOException {
        log.info("message:  " + message);
        String body = new JSONArray(new String[]{message}).toString();
        log.info("body  :  " + body);
//        String body = message;
        HttpResponse<JsonNode> jsonResponse = Unirest.post(SENTIMENT_URL)
                .header("Accept", "application/json")
                .header("X-Token", "dfRKQEfX.33618.MrvbkXnf7-6I")
                .body(body)
                .asJson();
        log.info(jsonResponse.getBody().toString());
        Unirest.shutDown();
        return jsonResponse.getBody().toString();
    }
}
