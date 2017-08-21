package cn.tw.service;

import cn.tw.pojo.User;

public interface UserServise {
    User findUserByAccount(String username, String password) throws Exception;
}
