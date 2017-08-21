package cn.tw.dao;

import cn.tw.pojo.RoleMenuKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(RoleMenuKey key);

    int insert(RoleMenuKey record);

    int insertSelective(RoleMenuKey record)throws Exception;

    List<String> selectMenuIdsByRoleId(@Param("roleid") Integer id)throws Exception;
}