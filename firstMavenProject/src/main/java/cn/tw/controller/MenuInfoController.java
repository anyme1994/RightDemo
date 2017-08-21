package cn.tw.controller;
import cn.tw.pojo.Menu;
import cn.tw.service.MenuService;
import cn.tw.service.RoleMenuKeyService;
import cn.tw.util.MenuBean;
import cn.tw.util.TreeUtil;
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
@RequestMapping("menuInfo")
public class MenuInfoController {
    @Resource
    private MenuService menuService;
    @Resource
    private RoleMenuKeyService roleMenuKeyService;
    @RequestMapping("toMenuPage")
    public String toMenuPage(){
        return "menuPage";
    }
    @RequestMapping("queryMenu")
    public @ResponseBody
    Map<String,Object> queryUser(@RequestParam(value = "page", required = false) int page,
                                 @RequestParam(value = "rows", required = false) int rows, Menu menu){
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(page,rows);
        List<Menu> roleList = menuService.findMenuBy(menu);
        PageInfo<Menu> pageInfo = new PageInfo<>(roleList);
        Page<Menu> pages = (Page<Menu>) roleList;
        map.put("total",pageInfo.getTotal());
        map.put("rows",roleList);
        return map;
    }
    @RequestMapping("getAllMenus")
    public @ResponseBody
    List<MenuBean> getALLMenu(){
        List<Menu> menus = menuService.getAllMenus();
        List<MenuBean> menuBeans = TreeUtil.generatorTree(menus);
        return menuBeans;
    }

    @RequestMapping("getRoleMenus")
    public @ResponseBody
    List<MenuBean> getRoleMenus(Integer roleid) {
        List<MenuBean> menuBeans = null;
        try {
            List<String> menuIds = roleMenuKeyService.findMenuIds(roleid);
            List<Menu> menuList = menuService.findMenusByIds(menuIds);
            menuBeans = TreeUtil.generatorTree(menuList);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return menuBeans;
    }
}
