package cn.tw.service.impl;

import cn.tw.dao.UserMapper;
import cn.tw.pojo.User;
import cn.tw.service.UserInfoService;
import cn.tw.util.ExceptionHanding;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
    @Resource
    private UserMapper userDAO;
    @Override
    public List<User> findUserBy(User user) {
        List<User> userList = this.userDAO.findUserBy(user);
        return userList;
    }

    @Override
    public void addUser(User user) throws Exception {
        try {
            this.userDAO.insert(user);
        }catch (Exception e){
            throw new  ExceptionHanding("添加失败，用户名重复");
      }
    }

    @Override
    public void deleteUser(Integer id)throws Exception{
        try {
            this.userDAO.deleteByPrimaryKey(id);
        }catch (Exception e){
            throw new ExceptionHanding("删除失败");
        }
    }

    @Override
    public void updateUser(User user) throws Exception {
        try {
            this.userDAO.updateByPrimaryKeySelective(user);
        }catch (Exception e){
            throw new ExceptionHanding("更新失败");
        }
    }
}

