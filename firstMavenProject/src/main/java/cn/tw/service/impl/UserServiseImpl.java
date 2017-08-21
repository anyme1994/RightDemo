package cn.tw.service.impl;

import cn.tw.dao.UserMapper;
import cn.tw.pojo.User;
import cn.tw.service.UserServise;
import cn.tw.util.ExceptionHanding;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static cn.tw.util.StringUtil.$;

@Service("userServise")
public class UserServiseImpl implements UserServise {
    @Resource
    private UserMapper userDAO;
    @Override
    public User findUserByAccount(String username, String password) throws Exception {
        username= (String) $("账号为空！",username);
        password= (String) $("密码为空！",password);
        User user=this.userDAO.findUserByAccount(username,password);
        if (user==null){
            throw new ExceptionHanding("不存在该用户！");
        }
        return user;
    }
}
