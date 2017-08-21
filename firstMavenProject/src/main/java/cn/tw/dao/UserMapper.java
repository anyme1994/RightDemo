package cn.tw.dao;

import cn.tw.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id)throws Exception;

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User record);

    User findUserByAccount(@Param("username") String username,@Param("password") String password)throws Exception;

    List<User> findUserBy(User user);

    void addUser(User user)throws Exception;
}