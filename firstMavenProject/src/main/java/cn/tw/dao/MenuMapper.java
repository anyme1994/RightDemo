package cn.tw.dao;

import cn.tw.pojo.Menu;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String id)throws Exception;

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> findMenuBy(Menu menu);

    List<Menu> getAllMenus();
}