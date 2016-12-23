package egovframework.codebuilder.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.ColumnsSearchVO;
import egovframework.codebuilder.vo.ColumnsVO;
import egovframework.com.cmm.service.impl.EgovClient1AbstractDAO;

@Repository("tableColumnsClient1DAO")
public class ColumnsClient1DAO extends EgovClient1AbstractDAO	 {

	@SuppressWarnings("unchecked")
	public List<ColumnsVO> selectTableColumnsList(ColumnsSearchVO vo) throws Exception {
		return (List<ColumnsVO>) list("TableColumnsDAO.selectTableColumnsList", vo);
	}

	public int selectTableColumnsListCnt(ColumnsSearchVO vo) throws Exception {
		return (Integer) select("TableColumnsDAO.selectTableColumnsListCnt", vo);
	}

}
