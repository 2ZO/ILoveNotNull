package org.kosta.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.model.VO.ProgramVO;
import org.kosta.model.VO.TeacherVO;
import org.kosta.model.etc.DataSourceManager;


public class ClassDAO {
	private static ClassDAO dao=new ClassDAO();
	private DataSource dataSource;
	private ClassDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ClassDAO getInstance(){		
		return dao;
	}	
	public void closeAll(PreparedStatement pstmt,
			Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,
			Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void createClass(String teacherId, String programId, String day, String time, String capacity) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="insert into yoga_class values(class_seq.nextval,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, programId);
			pstmt.setString(2, teacherId);
			pstmt.setString(3, capacity);
			pstmt.setString(4, time);
			pstmt.setString(5, day);
			pstmt.executeUpdate();			
		}finally {
			closeAll(pstmt, con);
		}			
	}
	public ArrayList<String> getClassListById(String teacherId) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<String> list=new ArrayList<String>();
		try {
			con=dataSource.getConnection();
			String sql="select p.programName from yoga_class c, YOGA_PROGRAM p where c.programno=p.programno and teacherid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, teacherId);
			rs=pstmt.executeQuery();
			while(rs.next())
				list.add(rs.getString(1));
		}finally {
			closeAll(rs,pstmt, con);
		}
		return list;
	}

}
