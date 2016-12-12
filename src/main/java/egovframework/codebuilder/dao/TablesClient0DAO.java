package egovframework.codebuilder.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TablesVO;
import egovframework.com.cmm.service.impl.EgovClient0AbstractDAO;

@Repository("tablesClient0DAO")
public class TablesClient0DAO extends EgovClient0AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<TablesVO> selectTablesList(TablesVO vo) throws Exception {
		List<TablesVO> tablesVOList = (List<TablesVO>) list("TablesDAO.selectTablesList", vo);
		Iterator<TablesVO> tablesVOIterator = tablesVOList.iterator();
		while(tablesVOIterator.hasNext()) {
			TablesVO tablesVO = tablesVOIterator.next();
			if (tablesVO.getTableComments() != null) {
				tablesVO.setTableComments(new String(tablesVO.getTableComments().getBytes("8859_1"), "KSC5601"));
			}
		}
		return tablesVOList;
	}

	public int selectTablesListCnt(TablesVO vo) throws Exception {
		return (Integer) select("TablesDAO.selectTablesListCnt", vo);
	}

}
