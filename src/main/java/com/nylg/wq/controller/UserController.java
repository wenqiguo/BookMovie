package com.nylg.wq.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.User;
import com.nylg.wq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/delUser")
    @ResponseBody
    public Map<String,String> delUser(Long userId){
        Map<String,String> map = userService.delectByUserId(userId);
        return map;

    }
    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Map<String,String> loginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        User u = (User) request.getSession().getAttribute("user");
        Map<String,String> map = new HashMap<>();
        if (u!=null){
           map.put("type","error");
        }
        map.put("type","success");
        return map;

    }

    /**
     * 修改用户密码
     */
    @RequestMapping("/modifyUserPwd")
    @ResponseBody
    public Map<String,String> modifyUserPwd(User user, HttpSession session){
        System.out.println(user);
        int i = userService.modifyUser(user);
        Map<String,String> ret = new HashMap<>();
        if (i>0){
            session.removeAttribute("user");
            ret.put("type","success");
            return ret;
        }else{
            ret.put("type","error");
            return ret;
        }
    }


    /**
     * 修改前台用户信息
     */
    @RequestMapping(value = "/uploadHeadImg")
    @ResponseBody
    public Map updateShowUser(@RequestParam(value = "file",required = false) MultipartFile file,
                                             User u,
                                             HttpServletRequest request){
        Map ret = new HashMap();
        if (file!=null){
            String path  = request.getSession().getServletContext().getRealPath("/static/static/upload/head");
            File target = new File(path);
            if (!target.exists()){
                target.mkdirs();
            }
            String oldName = file.getOriginalFilename();
            String type = oldName.substring(oldName.lastIndexOf(".")+1,oldName.length());
            String newName = System.currentTimeMillis()+"."+type;
            try {
                file.transferTo(new File(target,newName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            u.setUserPhoto("/static/static/upload/head/"+newName);
        }

        int i = userService.modifyUser(u);
        if (i<0){
            ret.put("type","error");
            return ret;

        }
        ret.put("type","success");
        ret.put("data",u);
        return ret;

    }



    /**
     * 修改用户信息
     *
     */
    @RequestMapping(value = "/modifyUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> modifyUser( User user){
        Map<String,String> map = new HashMap<>();
        int i = userService.modifyUser(user);
        if (i>0){
           map.put("type","success");
        }else{
            map.put("type","error");
        }
        return map;
    }
    /**
     * 模糊查询带分页,page当前页，limit步长
     */
    @RequestMapping("findTotalUser")
    @ResponseBody
    public JSONObject findTotalUser(@RequestParam(value="page",defaultValue="1")Integer page,
                                    @RequestParam(value="limit",defaultValue="10")Integer limit,
                                    @RequestParam(value = "user_name",required = false) String userName){
        PageInfo<User> userPageInfo = userService.findByPage(page,limit,userName);
        JSONObject obj = new JSONObject();
        obj.put("message", "");
        obj.put("status", 0);
        //返回总页数和总的结果集
        obj.put("length",userPageInfo.getTotal());
        obj.put("data", userPageInfo.getList());
        return obj;

    }

    /**
     * 管理员去管理界面
     */
    @RequestMapping("/adminMovie")
    public String adminMovie(){
        return "manage";
    }

    /**
     * customer
     * 去前台主页面
     */
    @RequestMapping("/mainMovie")
    public String mainMovie(){
        return "mainPage";
    }

    /**
     * 影院前台账号登录密码的验证
     *
     */
    @RequestMapping("/verifyLogin")
    @ResponseBody
    public JSONObject verifyLogin(User user,HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        User dbUser = userService.selectByName(user.getUserName());
        if (dbUser==null){
            jsonObject.put("type","errorUserName");
            jsonObject.put("msg","用户不存在，请注册");
            return jsonObject;
        }
        if (!dbUser.getUserPwd().equals(user.getUserPwd())){
            jsonObject.put("type","errorPassword");
            jsonObject.put("msg","密码错误");
            return jsonObject;
        }
        jsonObject.put("type","success");
        jsonObject.put("msg","登录成功");
        jsonObject.put("data",dbUser);
        request.getSession().setAttribute("user",dbUser);
        return jsonObject;
    }

    /**
     * 影院前台注册
     * @param user
     * @return
     */

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addCustomer(User user){
        JSONObject jsonObject = new JSONObject();
        User dataUser = userService.selectByName(user.getUserName());
        if (dataUser!=null){
            jsonObject.put("type","error");
            jsonObject.put("msg","账号已经存在，请登录");

        }else {
            user.setUserRole(0);
            int i = userService.addUser(user);

            if (i > 0) {
                jsonObject.put("msg","账号注册成功，请登录");
                jsonObject.put("type","success");

            } else {
                jsonObject.put("msg","账号注册失败，请联系管理员");
                jsonObject.put("type","error");

            }
        }
        return jsonObject;

    }

    /**
     *
     * 登录注册页面
     */
    @RequestMapping("/showLogin")
    public String showLogin(){
        return "login";
    }



}
