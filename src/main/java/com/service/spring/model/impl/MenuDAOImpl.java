package com.service.spring.model.impl;

import com.service.spring.domain.Menu;
import com.service.spring.domain.OrderList;
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
	public int addMenu(Menu menu) {
		return sqlSession.insert(NS+"addMenu",menu);
	}

	@Override
	public int updateMenu(Menu menu) {
		return sqlSession.update(NS+"updateMenu", menu);
	}

	@Override
	public int deleteMenu(List<String> list) {
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

	@Override
	public List<Menu> selectMenuByCategory(String category) {
		return sqlSession.selectList(NS+"selectMenuByCategory", category);
	}

	@Override
	public int updateMenuStar(OrderList orderList) {
		return sqlSession.update(NS+"updateMenuStar", orderList);
	}
	
	@Override
	public List<Menu> selectMenuByRank() {
		return sqlSession.selectList(NS+"selectMenuByRank");
	}

}
