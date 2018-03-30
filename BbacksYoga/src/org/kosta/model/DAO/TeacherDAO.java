package org.kosta.model.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.kosta.model.etc.DataSourceManager;



public class TeacherDAO {
	private static TeacherDAO instance=new TeacherDAO();
	private DataSource datasource;
	private TeacherDAO() {
		datasource=DataSourceManager.getInstance().getDataSource();
	}
	public static TeacherDAO getInstance() {
		return instance;
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt, Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		closeAll(null, pstmt, con);
	}
	public void AddTeacher(String name, String nick, String profile, String imgURL) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=datasource.getConnection();
			String sql="insert into yoga_teacher(teacherId,teacherName,teacherNick,teacherProfile,imgUrl) values(tchNo_seq.nextval,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, nick);
			pstmt.setString(3, profile);
			pstmt.setString(4, imgURL);
			pstmt.executeUpdate();			
		}finally {
			closeAll(pstmt, con);
		}		
	}
}
