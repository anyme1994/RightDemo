package cn.tw.service;

import java.util.List;

public interface RoleMenuKeyService {
    List<String> findMenuIds(Integer id)throws Exception;

    void addRoleMenuKey(String[] ids,Integer roleid)throws Exception;
}
