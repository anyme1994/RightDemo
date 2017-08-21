package cn.tw.service;

import cn.tw.pojo.User;

import java.util.List;

public interface UserInfoService {
    List<User> findUserBy(User user);

    void addUser(User user)throws Exception;

    void deleteUser(Integer id)throws Exception;

    void updateUser(User user)throws Exception;
}
