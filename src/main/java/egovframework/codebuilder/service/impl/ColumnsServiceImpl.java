package egovframework.codebuilder.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.codebuilder.dao.ColumnsClient0DAO;
import egovframework.codebuilder.dao.ColumnsClient1DAO;
import egovframework.codebuilder.dao.ColumnsClient2DAO;
import egovframework.codebuilder.service.ColumnsService;
import egovframework.codebuilder.vo.ColumnsSearchVO;
import egovframework.codebuilder.vo.ColumnsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("tableColumnsService")
public class ColumnsServiceImpl extends EgovAbstractServiceImpl implements ColumnsService {

	@Resource(name = "tableColumnsClient0DAO")
	private ColumnsClient0DAO tableColumnsClient0DAO;

	@Resource(name = "tableColumnsClient1DAO")
	private ColumnsClient1DAO tableColumnsClient1DAO;

	@Resource(name = "tableColumnsClient2DAO")
	private ColumnsClient2DAO tableColumnsClient2DAO;

	public Map<String, Object> selectDS0TableColumnsList(ColumnsSearchVO searchVO) throws Exception {
		List<ColumnsVO> result = tableColumnsClient0DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient0DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS1TableColumnsList(ColumnsSearchVO searchVO) throws Exception {
		List<ColumnsVO> result = tableColumnsClient1DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient1DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS2TableColumnsList(ColumnsSearchVO searchVO) throws Exception {
		List<ColumnsVO> result = tableColumnsClient2DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient2DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> executeQuery(String sqlStr) throws Exception {
		return tableColumnsClient2DAO.executeQuery(sqlStr);
	}
}
