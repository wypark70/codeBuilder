package egovframework.codebuilder.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.ColumnsSearchVO;
import egovframework.codebuilder.vo.ColumnsVO;
import egovframework.com.cmm.service.impl.EgovClient0AbstractDAO;

@Repository("tableColumnsClient0DAO")
public class ColumnsClient0DAO extends EgovClient0AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ColumnsVO> selectTableColumnsList(ColumnsSearchVO vo) throws Exception {
		List<ColumnsVO> tableColumnsVOList = (List<ColumnsVO>) list("TableColumnsDAO.selectTableColumnsList", vo);
		Iterator<ColumnsVO> tableColumnsVOIterator = tableColumnsVOList.iterator();
		while (tableColumnsVOIterator.hasNext()) {
			ColumnsVO tableColumnsVO = tableColumnsVOIterator.next();
			if (tableColumnsVO.getColumnComments() != null) {
				tableColumnsVO.setColumnComments(new String(tableColumnsVO.getColumnComments().getBytes("8859_1"), "KSC5601"));
			}
		}
		return tableColumnsVOList;
	}

	public int selectTableColumnsListCnt(ColumnsSearchVO vo) throws Exception {
		return (Integer) select("TableColumnsDAO.selectTableColumnsListCnt", vo);
	}

}
