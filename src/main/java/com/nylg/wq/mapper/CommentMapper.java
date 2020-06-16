package com.nylg.wq.mapper;

import com.nylg.wq.pojo.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(Long commentId);

    int insert(Comment record);
    //通过电影id查找所有评论
    List<Comment> findCommentsByMovieId(Long movieId);

    //分页查询所有的评论
    List<Comment> lookCommentByPage();

    //通过用户账号模糊查询
    List<Comment> findCommentsByName(String value);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Long commentId);
    //通过用户id和电影id查找，判断用户是否已经评论过该电影

    Comment selectByMovieAndUserId(@Param(value = "user_id") Long userId, @Param(value = "movie_id") Long movieId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}