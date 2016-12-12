package egovframework.codebuilder.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TableColumnsVO;
import egovframework.com.cmm.service.impl.EgovClient1AbstractDAO;

@Repository("tableColumnsClient1DAO")
public class TableColumnsClient1DAO extends EgovClient1AbstractDAO	 {

	@SuppressWarnings("unchecked")
	public List<TableColumnsVO> selectTableColumnsList(TableColumnsVO vo) throws Exception {
		return (List<TableColumnsVO>) list("TableColumnsDAO.selectTableColumnsList", vo);
	}

	public int selectTableColumnsListCnt(TableColumnsVO vo) throws Exception {
		return (Integer) select("TableColumnsDAO.selectTableColumnsListCnt", vo);
	}

}
