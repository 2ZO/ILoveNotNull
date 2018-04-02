package org.kosta.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.model.VO.ProgramVO;
import org.kosta.model.etc.DataSourceManager;

public class ProgramDAO {
	private static ProgramDAO dao = new ProgramDAO();
	private DataSource datasource;

	public ProgramDAO() {
		datasource=DataSourceManager.getInstance().getDataSource();
	}
	public static ProgramDAO getInstance(){
		return dao;
	}
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		closeAll(null, pstmt, con);
	}
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void addProgram(String programName, String programDetail) throws SQLException { 
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = datasource.getConnection();
			String sql ="insert into yoga_program(programNo, programName, programDetail) values(prgNo_seq.nextval,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, programName);
			pstmt.setString(2, programDetail);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public ArrayList<ProgramVO> getProgramList() throws SQLException {
		ArrayList<ProgramVO> list = new ArrayList<ProgramVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = datasource.getConnection();
			String sql = "select programNo,programName from yoga_program";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ProgramVO(rs.getString(1), rs.getString(2)));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public ProgramVO getProgramListByNo(int programNo) throws SQLException {
		ProgramVO vo=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = datasource.getConnection();
			String sql = "select programNo,programName,programDetail from yoga_program where programNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, programNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ProgramVO(rs.getString(1), rs.getString(2), rs.getString(3));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}
	public int getProgramListTotal() throws SQLException {
		int count=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = datasource.getConnection();
			String sql = "select count(*) from yoga_program";
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
		}finally {
			closeAll(pstmt, con);
		}
		return count;
	}
}
