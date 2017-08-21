package cn.tw.service.impl;

import cn.tw.dao.RoleMapper;
import cn.tw.pojo.Role;
import cn.tw.service.RoleInfoService;
import cn.tw.util.ExceptionHanding;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("roleInfoService")
public class RoleInfoServiceImpl implements RoleInfoService {
    @Resource
    private RoleMapper roleDAO;
    @Override
    public Role findRoleById(Integer roleid) {
        Role role = this.roleDAO.findRoleById(roleid);
        return role;
    }

    @Override
    public List<Role> findRoleBy(Role role) {
        List<Role> roleList = this.roleDAO.findRoleBy(role);
        return roleList;
    }

    @Override
    public void addRole(Role role) throws Exception{
        try {
            this.roleDAO.insertSelective(role);
        }catch (Exception e){
            throw new ExceptionHanding("添加失败，角色名重复！");
        }

    }

    @Override
    public void updateUser(Role role) throws Exception {
        try {
            this.roleDAO.updateByPrimaryKeySelective(role);
        }catch (Exception e){
            throw new ExceptionHanding("更新角色失败！");
        }

    }

    @Override
    public void deleteRole(Role role)throws Exception {
        try {
            this.roleDAO.deleteByPrimaryKey(role.getId());
        }catch (Exception e){
            throw new ExceptionHanding("删除角色失败！");
        }
    }
}
