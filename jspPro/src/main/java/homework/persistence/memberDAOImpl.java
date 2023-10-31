package homework.persistence;

import java.sql.SQLException;

import homework.domain.memberDTO;

public class memberDAOImpl implements memberDAO{

	@Override
	public int login(memberDTO memberdto) throws SQLException {
		String sql = " SELECT id, pwd FROM member "
				+ " WHERE id = ? AND pwd = ? ";
		return 0;
	}

}
