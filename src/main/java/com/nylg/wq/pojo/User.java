package com.nylg.wq.pojo;

import java.util.Objects;

public class User {
    private Long userId;  //0是客户 1是管理员

    private String userName;

    private String userPwd;

    private String userEmail;

    private Integer userRole;

    private String userPhoto;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto == null ? null : userPhoto.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userId, user.userId) &&
                Objects.equals(userName, user.userName) &&
                Objects.equals(userPwd, user.userPwd) &&
                Objects.equals(userEmail, user.userEmail) &&
                Objects.equals(userRole, user.userRole) &&
                Objects.equals(userPhoto, user.userPhoto);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userName, userPwd, userEmail, userRole, userPhoto);
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userRole=" + userRole +
                ", userPhoto='" + userPhoto + '\'' +
                '}';
    }

    public User() {
    }

    public User(Long userId, String userName, String userPwd, String userEmail, Integer userRole, String userPhoto) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userEmail = userEmail;
        this.userRole = userRole;
        this.userPhoto = userPhoto;
    }
}