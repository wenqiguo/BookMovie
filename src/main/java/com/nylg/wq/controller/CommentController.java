package com.nylg.wq.controller;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.Comment;
import com.nylg.wq.pojo.User;
import com.nylg.wq.service.CommentService;
import com.nylg.wq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;



    /**
     * 后台管理的分页查询
     * @param page
     * @param limit

     * @return
     */
    @RequestMapping("/findCommentsByPage")
    @ResponseBody
    public Map findCommentsByPage(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                  @RequestParam(value = "limit",defaultValue = "10") Integer limit,
                                  @RequestParam(value = "user_name",required = false) String userName){
        Map map = new HashMap();
        PageInfo<Comment> commentList = commentService.lookCommentByPage(page,limit,userName);
        List<Comment> Comments = commentList.getList();
        for (Comment comm : Comments){
            User commentUser = userService.selectByUserId(comm.getUserId());
            comm.setCommentUser(commentUser);
        }
        map.put("code",0);
        map.put("msg","解析成功");
        map.put("count",commentList.getTotal());
        map.put("data",Comments);
        return map;
    }

    /**
     * 删除评论
     * @param commentId
     * @return
     */
    @RequestMapping("/removeComemnt")
    @ResponseBody
    public Map<String,String> removeComemnt(Long commentId){
        Map<String,String> ret = new HashMap<>();
        int i = commentService.deleteByCommentId(commentId);
        if (i<0){
            ret.put("status","error");
            ret.put("msg","删除失败");
        }
        ret.put("status","success");
        ret.put("msg","删除成功");
        return ret;
    }

    /**
     * 修改评论
     * @param commentId
     * @param commentContent
     * @return
     */
    @RequestMapping("/ModifyComment")
    @ResponseBody
    public Map<String,String> ModifyComment(Long commentId,String commentContent){
        int i = commentService.updateByPrimaryKeySelective(commentId,commentContent);
        Map<String,String> ret = new HashMap<>();
        if (i<0){
            ret.put("status","error");
            ret.put("msg","修改失败");
        }
        ret.put("status","success");
        ret.put("msg","修改成功");
        return ret;
    }

    /**
     * 添加评论
     * @param movieId
     * @param commentContent
     * @param request
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public Map<String,String> insertComment(Long movieId, String commentContent, HttpServletRequest request){
        User loginUser = (User) request.getSession().getAttribute("user");
        Map<String,String> ret = new HashMap<>();
        Comment beComment = commentService.selectByMovieAndUserId(loginUser.getUserId(),movieId) ;
        if (beComment!=null){
            ret.put("type","false");
            ret.put("msg","您已参与过评论,祝你生活愉快！");
            return ret;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date now = new Date();
        String time = sdf.format(now);
        Comment userComment = new Comment();
        userComment.setCommentTime(time);
        userComment.setCommentContent(commentContent);
        userComment.setMovieId(movieId);
        userComment.setUserId(loginUser.getUserId());
        int i = commentService.insertComment(userComment);
        if (i<0){
            ret.put("type","error");
        }
        ret.put("type","success");

        return ret;

    }
}
