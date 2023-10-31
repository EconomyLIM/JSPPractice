package homework.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import homework.domain.memberDTO;

public class memberDAOImpl implements memberDAO{
	private Connection conn = null;
	@Override
	public int login(memberDTO memberdto) throws SQLException {
		int rowCnt = 0;
		String sql = " SELECT id, pwd FROM member "
				+ " WHERE id = ? AND pwd = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(rowCnt, sql);
		return 0;
	}

}
