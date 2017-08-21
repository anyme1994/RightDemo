package cn.tw.dao;

import cn.tw.pojo.Role;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id)throws Exception;

    int insert(Role record);

    int insertSelective(Role role)throws Exception;

    Role selectByPrimaryKey(Integer id)throws Exception;

    int updateByPrimaryKeySelective(Role record)throws Exception;

    int updateByPrimaryKey(Role record);

    Role findRoleById(Integer roleid);

    List<Role> findRoleBy(Role role);
}