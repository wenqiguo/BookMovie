package com.nylg.wq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nylg.wq.mapper.CommentMapper;
import com.nylg.wq.mapper.UserMapper;
import com.nylg.wq.pojo.Comment;
import com.nylg.wq.pojo.User;
import com.nylg.wq.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;


    @Override
    public int insertComment(Comment comment) {

        return commentMapper.insert(comment);
    }

    @Override
    public int updateByPrimaryKeySelective(Long commentId,String commentContent) {
        Comment comment = new Comment();
        comment.setCommentId(commentId);
        comment.setCommentContent(commentContent);
        return commentMapper.updateByPrimaryKeySelective(comment);
    }

    @Override
    public PageInfo<Comment> lookCommentByPage(Integer page, Integer limit,String userName) {

        PageHelper.startPage(page,limit);
        List<Comment> comments = commentMapper.findCommentsByName(userName);
        PageInfo<Comment> commentPageInfo = new PageInfo<>(comments);
        return commentPageInfo;
    }

    @Override
    public int deleteByCommentId(Long commentId) {
        return commentMapper.deleteByPrimaryKey(commentId);
    }

    @Override
    public Comment selectByMovieAndUserId(Long userId, Long movieId) {
        return commentMapper.selectByMovieAndUserId(userId,movieId);
    }
}
