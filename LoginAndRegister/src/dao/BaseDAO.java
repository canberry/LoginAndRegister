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
	//��̬��  ��ִ����ִ��һ��  �����ڳ������ִ��
	static {
		//�����������ݿ���ļ�
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
			//����������
			Class.forName(className);
			//�������Ӷ���
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
		}
		
		return con;
	}
}
