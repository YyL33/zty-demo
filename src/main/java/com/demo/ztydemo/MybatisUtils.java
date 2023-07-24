package com.demo.ztydemo;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MybatisUtils {
    private static SqlSessionFactory factory;

    static {
        try {
            String resource = "mybatis-config.xml";              //获取核心配置文件路径
            InputStream inputStream = Resources.getResourceAsStream(resource);  //获取核心配置文件信息,转换为java的输入流
            factory = new SqlSessionFactoryBuilder().build(inputStream);//声明sql的回话工厂，并将输入流赋值给它
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSession openSession(){
        return factory.openSession(true);  //打开回话；true:自动提交
    }
}

