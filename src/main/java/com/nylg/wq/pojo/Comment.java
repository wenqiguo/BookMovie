package com.nylg.wq.pojo;

import java.util.Objects;

public class Comment {
    private Long commentId;

    private Long userId;

    private String commentContent;

    private Long movieId;

    private String commentTime;

    private User commentUser;

    public User getCommentUser() {
        return commentUser;
    }

    public void setCommentUser(User commentUser) {
        this.commentUser = commentUser;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comment comment = (Comment) o;
        return Objects.equals(commentId, comment.commentId) &&
                Objects.equals(userId, comment.userId) &&
                Objects.equals(commentContent, comment.commentContent) &&
                Objects.equals(movieId, comment.movieId) &&
                Objects.equals(commentTime, comment.commentTime) &&
                Objects.equals(commentUser, comment.commentUser);
    }

    @Override
    public int hashCode() {
        return Objects.hash(commentId, userId, commentContent, movieId, commentTime, commentUser);
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", userId=" + userId +
                ", commentContent='" + commentContent + '\'' +
                ", movieId=" + movieId +
                ", commentTime='" + commentTime + '\'' +
                ", commentUser=" + commentUser +
                '}';
    }

    public Comment() {
    }

    public Comment(Long commentId, Long userId, String commentContent, Long movieId, String commentTime, User commentUser) {
        this.commentId = commentId;
        this.userId = userId;
        this.commentContent = commentContent;
        this.movieId = movieId;
        this.commentTime = commentTime;
        this.commentUser = commentUser;
    }
}