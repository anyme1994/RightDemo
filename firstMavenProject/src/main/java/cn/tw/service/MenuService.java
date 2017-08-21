package cn.tw.service;

import cn.tw.pojo.Menu;

import java.util.List;

public interface MenuService {
    List<Menu> findMenusByIds(List<String> menuIds)throws Exception;

    List<Menu> findMenuBy(Menu menu);

    List<Menu> getAllMenus();
}
