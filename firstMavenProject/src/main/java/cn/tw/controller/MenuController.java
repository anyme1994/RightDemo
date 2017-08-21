package cn.tw.controller;

import cn.tw.pojo.Menu;
import cn.tw.pojo.User;
import cn.tw.service.MenuService;
import cn.tw.service.RoleMenuKeyService;
import cn.tw.util.MenuBean;
import cn.tw.util.TreeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Resource
    private RoleMenuKeyService roleMenuKeyService;
    @Resource
    private MenuService menuService;
    /*@RequestMapping("getMenus")
    public @ResponseBody List<Menu> getMenus(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        List<String> menuIds = roleMenuKeyService.findMenuIds(user.getId());
        List<Menu> menus = menuService.findMenusByIds(menuIds);
        List<Menu> m=TreeNoteUtil.getFatherNode(menus);
        for (MenuBean menu:tree){
            System.out.println(menu);
        }
        return m;
    }*/
    @RequestMapping("getMenus")
    public @ResponseBody
    List<MenuBean> getMenus(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List<String> menuIds = null;
        List<MenuBean> tree = null;
        try {
            menuIds = roleMenuKeyService.findMenuIds(user.getRoleid());
            List<Menu> menus = menuService.findMenusByIds(menuIds);
            tree = TreeUtil.generatorTree(menus);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return tree;
    }
}
