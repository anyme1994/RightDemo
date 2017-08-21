package cn.tw.service.impl;

import cn.tw.dao.MenuMapper;
import cn.tw.pojo.Menu;
import cn.tw.service.MenuService;
import cn.tw.util.ExceptionHanding;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuMapper menuDAO;
    @Override
    public List<Menu> findMenusByIds(List<String> menuIds) throws Exception{
        List<Menu> menus = new ArrayList<>();
        for (String id:menuIds) {
            Menu menu=this.menuDAO.selectByPrimaryKey(id);
            menus.add(menu);
        }
        if (menus.isEmpty())
            throw new ExceptionHanding("该角色未分配菜单！");
        return menus;
    }

    @Override
    public List<Menu> findMenuBy(Menu menu) {
        List<Menu> menuList = this.menuDAO.findMenuBy(menu);
        return menuList;
    }

    @Override
    public List<Menu> getAllMenus() {
        return this.menuDAO.getAllMenus();
    }
}
