package cn.tw.controller;

import cn.tw.pojo.Role;
import cn.tw.service.RoleInfoService;
import cn.tw.service.RoleMenuKeyService;
import cn.tw.util.MessageBean;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("roleInfo")
public class RoleInfoController {

    @Resource
    private RoleInfoService roleInfoService;
    @Resource
    private RoleMenuKeyService roleMenuKeyService;

    @RequestMapping("toRolePage")
    public String toRolePage(){
        return "rolePage";
    }
    @RequestMapping("queryRole")
    public @ResponseBody
    Map<String,Object> queryUser(@RequestParam(value = "page", required = false) int page,
                                 @RequestParam(value = "rows", required = false) int rows, Role role){
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(page,rows);
        List<Role> roleList = roleInfoService.findRoleBy(role);
        PageInfo<Role> pageInfo = new PageInfo<>(roleList);
        Page<Role> pages = (Page<Role>) roleList;
        map.put("total",pageInfo.getTotal());
        map.put("rows",roleList);
        return map;
    }
    @RequestMapping("addRole")
    public @ResponseBody
    MessageBean addUser(Role user){
        try {
            this.roleInfoService.addRole(user);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","添加角色成功");
    }

    @RequestMapping("updateRole")
    public @ResponseBody
    MessageBean updateUser(Role role){
        try {
            this.roleInfoService.updateUser(role);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","更新角色成功!");
    }

    @RequestMapping("deleteRole")
    public @ResponseBody
    MessageBean deleteUser(Role role){
        try {
                this.roleInfoService.deleteRole(role);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","删除用户成功");
    }

    @RequestMapping("addMenus")
    public @ResponseBody
    MessageBean addMenus(String[] ids,Integer roleid){
        try {
            this.roleMenuKeyService.addRoleMenuKey(ids,roleid);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","添加成功");
    }

}
