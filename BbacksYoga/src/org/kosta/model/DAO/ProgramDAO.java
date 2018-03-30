package org.kosta.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

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
}
