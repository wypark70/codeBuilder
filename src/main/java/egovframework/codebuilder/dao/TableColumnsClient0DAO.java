package egovframework.codebuilder.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TableColumnsVO;
import egovframework.com.cmm.service.impl.EgovClient0AbstractDAO;

@Repository("tableColumnsClient0DAO")
public class TableColumnsClient0DAO extends EgovClient0AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<TableColumnsVO> selectTableColumnsList(TableColumnsVO vo) throws Exception {
		List<TableColumnsVO> tableColumnsVOList = (List<TableColumnsVO>) list("TableColumnsDAO.selectTableColumnsList",
				vo);
		Iterator<TableColumnsVO> tableColumnsVOIterator = tableColumnsVOList.iterator();
		while (tableColumnsVOIterator.hasNext()) {
			TableColumnsVO tableColumnsVO = tableColumnsVOIterator.next();
			if (tableColumnsVO.getTableComments() != null) {
				tableColumnsVO.setTableComments(new String(tableColumnsVO.getTableComments().getBytes("8859_1"), "KSC5601"));
			}
			if (tableColumnsVO.getColumnComments() != null) {
				tableColumnsVO.setColumnComments(new String(tableColumnsVO.getColumnComments().getBytes("8859_1"), "KSC5601"));
			}
		}
		return tableColumnsVOList;
	}

	public int selectTableColumnsListCnt(TableColumnsVO vo) throws Exception {
		return (Integer) select("TableColumnsDAO.selectTableColumnsListCnt", vo);
	}

}
