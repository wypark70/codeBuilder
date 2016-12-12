package egovframework.codebuilder.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TablesVO;
import egovframework.com.cmm.service.impl.EgovClient2AbstractDAO;

@Repository("tablesClient2DAO")
public class TablesClient2DAO extends EgovClient2AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<TablesVO> selectTablesList(TablesVO vo) throws Exception {
		return (List<TablesVO>) list("TablesDAO.selectTablesList", vo);
	}

	public int selectTablesListCnt(TablesVO vo) throws Exception {
		return (Integer) select("TablesDAO.selectTablesListCnt", vo);
	}

	@SuppressWarnings({ "deprecation" })
	public ResultSet selectForQuery(String sql) throws Exception {
		ResultSet resultSet = getSqlMapClient().getDataSource().getConnection().prepareStatement(sql).executeQuery();
		return resultSet;
	}

}
