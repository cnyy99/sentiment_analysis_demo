package com.bjfu.sentimentanalysis.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**  *  */
@Configuration
public class WebSecurityConfig extends WebMvcConfigurerAdapter {
    private Logger log = LoggerFactory.getLogger(WebSecurityConfig.class);

    /**
     * session key
     */
    public final static String SESSION_USER_KEY = "SESSION_USER_KEY";
    public final static String SESSION_USERTYPE_KEY = "SESSION_USERTYPE_KEY";
    public final static String SESSION_MSG_KEY = "SESSION_MSG_KEY";
    public final static String SESSION_MSG_EMAIL_KEY = "SESSION_MSG_EMAIL_KEY";
    public final static String USER_TYPE_NORMAL = "USER_TYPE_NORMAL";
    public final static String USER_TYPE_ADMINISTRATOR = "USER_TYPE_ADMINISTRATOR";
    public final static String SUCCESS = "成功";
    public final static String FAILURE = "失败";
    public final static String SKILL_KEY = "SKILL_KEY";
    public final static Integer SKILL_NUM_KEY = 9;
    public final static String COURSE_KEY = "COURSE_KEY";
    public final static Integer COURSE_NUM_KEY = 60;
    public final static Integer COOKIE_MAX_AGE = 60 * 60 * 24;
    public final static String PASSWORD_SALT = "ddFjr!vn$BJ43tpAqw#y";

    @Bean
    public SecurityInterceptor getSecurityInterceptor() {
        return new SecurityInterceptor();
    }

    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration addInterceptor = registry.addInterceptor(getSecurityInterceptor());
//        排除配置
        addInterceptor.excludePathPatterns("/error");
        addInterceptor.excludePathPatterns("/data/analy");
        addInterceptor.excludePathPatterns("/data/anal");
        addInterceptor.excludePathPatterns("/");
//        addInterceptor.excludePathPatterns("/login**");
        addInterceptor.excludePathPatterns("/toindex");
//        addInterceptor.excludePathPatterns("/");
        addInterceptor.excludePathPatterns("/static/**");
//        addInterceptor.excludePathPatterns("/comment");
        addInterceptor.excludePathPatterns("/index");
//        addInterceptor.excludePathPatterns("/register");
//        拦截配置
//        addInterceptor.addPathPatterns("/**");
    }

    private class SecurityInterceptor extends HandlerInterceptorAdapter {
        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            HttpSession session = request.getSession();
            Cookie[] cookies = request.getCookies();
            String targetUrl = request.getRequestURI();
            String USER_TYPE = null;
            if (session.getAttribute(SESSION_USER_KEY) != null) {
                return true;
            }
            boolean isLogined = false;
            if (cookies == null) {
                log.error("cookies is null");
                String url = "/login";
                response.sendRedirect(url);
                return false;
            }
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(SESSION_USER_KEY)) {
                    session.setAttribute(SESSION_USER_KEY, cookie.getValue());
                    isLogined = true;
                    log.info("cookie: " + cookie.getName() + ": " + cookie.getValue());
                }
                if (cookie.getName().equalsIgnoreCase(SESSION_USERTYPE_KEY)) {
                    session.setAttribute(SESSION_USERTYPE_KEY, cookie.getValue());
                    isLogined = true;
                    USER_TYPE = cookie.getValue();
                    log.info("cookie: " + cookie.getName() + ": " + cookie.getValue());
                }
            }
            log.warn(USER_TYPE);
            log.warn(request.getRequestURI());

            if (targetUrl.contains("manage") && USER_TYPE != null && USER_TYPE.equalsIgnoreCase(USER_TYPE_NORMAL)) {
                response.sendRedirect("/404");
                return false;
            }
            if (isLogined)
                return true;
            String url = "/login";
            response.sendRedirect(url);
            return false;
        }
    }
}