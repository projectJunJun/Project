package com.service.spring.model.impl;

import com.service.spring.model.MenuDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO {
    // mapper
    public static final String NS = "mapper.";

    @Autowired
    private SqlSession sqlSession;

}
