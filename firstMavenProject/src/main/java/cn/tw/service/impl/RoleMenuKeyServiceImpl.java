package cn.tw.service.impl;
import cn.tw.dao.RoleMenuMapper;
import cn.tw.pojo.RoleMenuKey;
import cn.tw.pojo.User;
import cn.tw.service.RoleMenuKeyService;
import cn.tw.util.ExceptionHanding;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import static cn.tw.util.StringUtil.$;

@Service("roleMenuKeyService")
public class RoleMenuKeyServiceImpl implements RoleMenuKeyService {
    @Resource
    private RoleMenuMapper roleMenuDAO;
    @Override
    public List<String> findMenuIds(Integer id) throws Exception {
        id= (Integer) $("角色id为空！",id);
        List<String> menuIds = this.roleMenuDAO.selectMenuIdsByRoleId(id);
        if (menuIds.isEmpty())
            throw new ExceptionHanding("未找到菜单");
        return menuIds;
    }

    @Override
    public void addRoleMenuKey(String[] ids,Integer roleid) throws Exception {
        try {
            for (String id:ids){
                id= (String) $("添加失败，节点为空",id);
                RoleMenuKey roleMenuKey = new RoleMenuKey();
                roleMenuKey.setMenuid(id);
                roleMenuKey.setRoleid(roleid);
                this.roleMenuDAO.insertSelective(roleMenuKey);
            }
        }catch (Exception e){
            throw new ExceptionHanding("添加菜单失败");
        }
    }
}
