package org.kosta.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


import org.kosta.model.VO.PostVO;
import org.kosta.model.etc.DataSourceManager;

public class PostDAO {
	/*선화쨩을 위한 싱글톤과 커넥션풀*/
	private static PostDAO dao=new PostDAO();
	private DataSource dataSource;
	private PostDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static PostDAO getInstance(){		
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
	public void createPost(String title, String content, String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="insert into post values(post_seq.nextval,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}		
	}
	public ArrayList<PostVO> getPostingList() throws SQLException {
		ArrayList<PostVO> list=new ArrayList<PostVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select postNo,title,id,to_char(regdate,'YYYY.MM.DD') from POST order by postNo desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				pvo.setPostNo(rs.getString(1));
				pvo.setTitle(rs.getString(2));
				pvo.setId(rs.getString(3));
				pvo.setRegDate(rs.getString(4));
				list.add(pvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public int getTotalPostCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=dataSource.getConnection();
			String sql="select count(*) from post";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		}finally {
			closeAll(rs, pstmt, con);
		}
		return count;
	}
	public PostVO getPostDetailByPostNo(String postNo) throws SQLException {
		// TODO Auto-generated method stub
		PostVO post = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select title,content,id,regDate from post where postNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(postNo));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				post = new PostVO(postNo, rs.getString(1), rs.getString(2),rs.getString(3), rs.getString(4));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return post;
	}
}
