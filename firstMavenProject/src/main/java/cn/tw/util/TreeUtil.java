package cn.tw.util;

import cn.tw.pojo.Menu;

import java.util.ArrayList;
import java.util.List;

public class TreeUtil {
    public static List<MenuBean> generatorTree(List<Menu> menus){
        List<MenuBean> menuTrees = new ArrayList<>();
        List<MenuBean> menuBeans = copyMenu2Bean(menus);
        for (MenuBean item : menuBeans) {
            //如果上级ID为空，则该节点为父节点
            if (StringUtil.isEmpty(item.getPid())) {
                //获取父节点下的子节点
                item.setChildren(generatorChildren(item.getId(), menuBeans));
                menuTrees.add(item);
            }
        }
        return menuTrees;
    }
    private static List<MenuBean> generatorChildren(String pid, List<MenuBean> menuBeans) {
        List<MenuBean> childrenTree = new ArrayList<>();
        for (MenuBean item : menuBeans) {
            if (StringUtil.isEmpty(item.getPid())) continue;
            if(item.getPid().equals(pid)){
                //递归获取子节点下的子节点，即设置树控件中的children
                item.setChildren(generatorChildren(item.getId(), menuBeans));
                childrenTree.add(item);
            }
        }
        return childrenTree;
    }
    private static List<MenuBean> copyMenu2Bean(List<Menu> menus){
        List<MenuBean> menuBeans = new ArrayList<>();
        MenuBean menuBean = null;
        for (Menu m:menus) {
            menuBean= new MenuBean();
            menuBean.setPid(m.getPid());
            menuBean.setId(m.getId());
            menuBean.setUrl(m.getUrl());
            menuBean.setText(m.getText());
            menuBeans.add(menuBean);
            List<Object> list = new ArrayList<>();
        }
        return menuBeans;
    }
}
