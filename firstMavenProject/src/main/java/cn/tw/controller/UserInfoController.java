package cn.tw.controller;

import cn.tw.pojo.Role;
import cn.tw.pojo.User;
import cn.tw.service.RoleInfoService;
import cn.tw.service.UserInfoService;
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
@RequestMapping("userInfo")
public class UserInfoController {
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private RoleInfoService roleInfoService;

    @RequestMapping("toUserPage")
    public String userPage(){
        return "userPage";
    }

    @RequestMapping("queryUser")
    public @ResponseBody
    Map<String,Object> queryUser(@RequestParam(value = "page", required = false) int page,
                                 @RequestParam(value = "rows", required = false) int rows,User user){
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(page,rows);
        List<User> userList = userInfoService.findUserBy(user);
        for (User u:userList) {
            if(u.getRoleid()!=null){
            Role role = roleInfoService.findRoleById(u.getRoleid());
            u.setRolename(role.getRolename());
            }
        }
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        Page<User> pages = (Page<User>) userList;
        map.put("total",pageInfo.getTotal());
        map.put("rows",userList);
        return map;
    }

    @RequestMapping("addUser")
    public @ResponseBody
    MessageBean addUser(User user){
        try {
            this.userInfoService.addUser(user);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","添加用户成功");
    }
    @RequestMapping("getRoleNames")
    public @ResponseBody
    List<Role> getRoleNames(Role role){
        List<Role> roleList = this.roleInfoService.findRoleBy(role);
        return roleList;
    }
    @RequestMapping("deleteUser")
    public @ResponseBody
    MessageBean deleteUser(User user,Integer[] ids){
        try {
            for (Integer id:ids){
            this.userInfoService.deleteUser(id);
            }
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","删除用户成功");
    }
    @RequestMapping("updateUser")
    public @ResponseBody
    MessageBean updateUser(User user){
        try {
            this.userInfoService.updateUser(user);
        } catch (Exception e) {
            return new MessageBean("errMSG",e.getMessage());
        }
        return new MessageBean("succMSG","更新成功!");
    }
    @RequestMapping("toRoleUserPage")
    public String toRoleUserPage(){
        return "roleUserList";
    }
    @RequestMapping("toRoleMenuPage")
    public String toRoleMenuPage(){
        return "roleMenuList";
    }
}
