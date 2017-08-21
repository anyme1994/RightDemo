package cn.tw.service;

import cn.tw.pojo.Role;

import java.util.List;

public interface RoleInfoService {
    Role findRoleById(Integer roleid);
    List<Role> findRoleBy(Role role);

    void addRole(Role user)throws Exception;

    void updateUser(Role role)throws Exception;

    void deleteRole(Role role)throws Exception;
}
