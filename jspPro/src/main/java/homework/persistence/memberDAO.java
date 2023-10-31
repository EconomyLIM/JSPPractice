package homework.persistence;

import java.sql.SQLException;

import homework.domain.memberDTO;

public interface memberDAO {
	int login (memberDTO memberdto) throws SQLException;
}
