package com.nylg.wq.service;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.Comment;

public interface CommentService {
    int insertComment(Comment comment);
     //修改评论
    int updateByPrimaryKeySelective(Long commentId,String commentContent);

    PageInfo<Comment> lookCommentByPage(Integer page,Integer limit,String userName);

    int deleteByCommentId(Long commentId);

    Comment selectByMovieAndUserId(Long userId,Long movieId);
}
