package dao.impl;

import java.sql.*;

import bean.User;

import dao.BaseDAO;

public class UserDAOImpl {
	BaseDAO bd = new BaseDAO();
	Connection con = bd.getCon();
	
	public boolean login(User user) {
		int r = 0;
		String sql = "select count(*) from user " +
				"where username=? and password=? and role=?";
		
		try {
			//创建预编译对象
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRole());
			//创建结果集对象
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				r = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		
		return r == 1;
	}
	
	public boolean register(User user) {
		boolean f = false;
		String sql = "insert into user(username, password, role) " +
				"values(?,?,?)";
		
		try {
			//创建预编译对象
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRole());
			ps.executeUpdate();
			
			f = true;
		} catch (Exception e) {
			
		}
		
		return f;
	}
	
	public boolean modifyInfo(User user) { 
		boolean f = false;
		String sql = "update User set password=? where username=?";
		
		try {
			//创建预编译对象
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUsername());
			ps.executeUpdate();
			
			f = true;
		} catch (Exception e) {
			
		}
		
		return f;
	}
}
