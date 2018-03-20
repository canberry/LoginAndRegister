package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * 
 * @author lxm
 *
 */
public class BaseDAO {
	static Properties prop = new Properties();
	//静态块  先执行且执行一次  优先于程序入口执行
	static {
		//加载连接数据库的文件
		try {
			prop.load(BaseDAO.class.getResourceAsStream("jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getCon() {
		Connection con = null;
		String className = prop.getProperty("className");
		String url = prop.getProperty("url");
		String user = prop.getProperty("user");
		String password = prop.getProperty("password");
		
		try {
			//加载驱动类
			Class.forName(className);
			//创建连接对象
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
		}
		
		return con;
	}
}
