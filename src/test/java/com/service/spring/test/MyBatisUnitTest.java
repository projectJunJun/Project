package com.service.spring.test;

import java.io.Reader;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.test.context.ContextConfiguration;

import com.service.spring.domain.Account;
import com.service.spring.domain.Menu;
import com.service.spring.domain.OrderList;

@MybatisTest
@ContextConfiguration(locations = {"classpath:config/SqlMapConfig.xml"})
public class MyBatisUnitTest {
	@Test
	public void unit() throws Exception{
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		// 1. SqlSessionFactory -- SqlSessionFactoryBean
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		
		// 2. SqlSession -- SqlSessionTemplate
		SqlSession session = factory.openSession();
		
		// 3. Test
		System.out.println(session.selectList("mapper.selectAccount"));
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		OrderList orderlist = new OrderList("table1", "2", "5", timestamp, 5, new Account("table1"), new Menu("2"));
		
//		Account table2 = new Account("table2", "table2", 2, 0);
//		session.insert("mapper.registerAccount", table2);
//		session.commit();
		
//		OrderList orderlist2 = new OrderList("table2", "2", "5", timestamp, 10, new Account("table2"), new Menu("2"));
//		session.update("mapper.updateOrderCount", orderlist2);
//		session.commit();
//		System.out.println(session.selectList("mapper.selectOrderByTable", orderlist2));
//		
//		OrderList orderlist3 = new OrderList("table2", "2", "5", 5);
//		session.update("mapper.updateOrder", orderlist3);
//		session.commit();
		
		System.out.println(session.selectList("mapper.selectOrder"));
		
		
		/*
		 * UserInfo user = new UserInfo("admin", "admin");
		 * UserInfo vo = session.selectOne("sql.pms.mapper.selectUser", user);
		 * System.out.println("LOGIN.." + vo);
		 */
//		Menu menu = new Menu("1", "12344", "12344", 1234, "1234", "1234");
////		session.insert("mapper.addMenu", menu);
////		session.commit();
//		
//		// update
////		session.update("mapper.updateMenu", menu);
////		session.commit();
//		List<String> mlist = new ArrayList<String>();
//		mlist.add("1");
//		session.delete("mapper.deleteMenu", mlist);
//		session.commit();
//		
//		List<Menu> list = session.selectList("mapper.selectMenu");
//		System.out.println(list);
		
//		Account admin = new Account("admin", "admin", 1);	// admin
//		Account table1 = new Account("table1", "table1", 1, 0);
//		session.insert("mapper.registerAccount", admin);
//		session.insert("mapper.registerAccount", table1);
//		session.commit();
		
		// update
//		Account table1 = new Account("table1", "table2", 2, 0);
//		session.update("mapper.updateAccount", table1);
//		
//		System.out.println(session.selectList("mapper.selectAccount"));
//		
//		List<String> mlist = new ArrayList<String>();
//		mlist.add("table1");
//		session.delete("mapper.deleteAccount", mlist);
//		
//		Account admin = new Account("admin", "admin", 1);
//		System.out.println(session.selectOne("mapper.selectAccount", admin).toString());
//		System.out.println(session.selectList("mapper.selectAccount"));
		
	}
}
