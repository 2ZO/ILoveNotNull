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


public class TeacherDAO {
		private static TeacherDAO instance=new TeacherDAO();
		private DataSource dataSource;
		private TeacherDAO() {
			dataSource=DataSourceManager.getInstance().getDataSource();
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
				con=dataSource.getConnection();
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
		public ArrayList<TeacherVO> getTeacherList() throws SQLException {
			Connection con=null;		
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<TeacherVO> list=new ArrayList<TeacherVO>();
			try {
				con=dataSource.getConnection();
				String sql="select teacherId, teacherName, teacherNick from yoga_teacher";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next())
					list.add(new TeacherVO(rs.getString(1),rs.getString(2),rs.getString(3)));
			}finally {
				closeAll(rs, pstmt, con);
			}
			return list;
		}

}