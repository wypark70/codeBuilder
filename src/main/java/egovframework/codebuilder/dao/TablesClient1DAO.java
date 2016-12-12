package egovframework.codebuilder.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TablesVO;
import egovframework.com.cmm.service.impl.EgovClient1AbstractDAO;

@Repository("tablesClient1DAO")
public class TablesClient1DAO extends EgovClient1AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<TablesVO> selectTablesList(TablesVO vo) throws Exception {
		return (List<TablesVO>) list("TablesDAO.selectTablesList", vo);
	}

	public int selectTablesListCnt(TablesVO vo) throws Exception {
		return (Integer) select("TablesDAO.selectTablesListCnt", vo);
	}

}
