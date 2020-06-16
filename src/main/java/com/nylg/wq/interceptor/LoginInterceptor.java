package com.nylg.wq.interceptor;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //request.getRequestURI() 返回除去host（域名或者ip）部分的路径
        String requestUri  = request.getRequestURI();
        Object user = request.getSession().getAttribute("user");
        if (user == null) {
            //表示未登录或者登录失效
            System.out.println("链接" + requestUri + "进入拦截器！");
            //判断是否是ajax请求
            if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                //表示是ajax请求
                 Map<String, String> interMap = new HashMap<String, String>();
                interMap.put("status", "error");
                String param = JSON.toJSONString(interMap);
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write(param);
                return false;
            }
            //表示是普通链接跳转，直接重定向到登录页面
            response.sendRedirect(request.getServletContext().getContextPath() + "/user/showLogin.do");
            return false;
        }
        return true;
    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
