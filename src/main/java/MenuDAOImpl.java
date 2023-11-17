package com.service.spring.model.impl;

import com.service.spring.domain.Menu;
import com.service.spring.model.MenuDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO {
    // mapper
    public static final String NS = "mapper.";

    @Autowired
    private SqlSession sqlSession;

	@Override
	public int addmenu(Menu menu) {
		return sqlSession.insert(NS+"addmenu",menu);
	}

	@Override
	public int updateMenu(Menu menu) {
		return sqlSession.update(NS+"updateMenu", menu);
	}

	@Override
	public int deleteMenu(List<Menu> list) {
		return sqlSession.delete(NS+"deleteMenu", list);
	}

	@Override
	public Menu selectMenu(Menu menu) {
		return sqlSession.selectOne(NS+"selectMenu",menu);
	}

	@Override
	public List<Menu> selectMenu() {
		return sqlSession.selectList(NS+"selectMenu",null);
	}

}
