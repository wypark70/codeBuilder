package egovframework.codebuilder.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.codebuilder.dao.TableColumnsClient0DAO;
import egovframework.codebuilder.dao.TableColumnsClient1DAO;
import egovframework.codebuilder.dao.TableColumnsClient2DAO;
import egovframework.codebuilder.service.TableColumnsService;
import egovframework.codebuilder.vo.TableColumnsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("tableColumnsService")
public class TableColumnsServiceImpl extends EgovAbstractServiceImpl implements TableColumnsService {

	@Resource(name = "tableColumnsClient0DAO")
	private TableColumnsClient0DAO tableColumnsClient0DAO;

	@Resource(name = "tableColumnsClient1DAO")
	private TableColumnsClient1DAO tableColumnsClient1DAO;

	@Resource(name = "tableColumnsClient2DAO")
	private TableColumnsClient2DAO tableColumnsClient2DAO;

	public Map<String, Object> selectDS0TableColumnsList(TableColumnsVO searchVO) throws Exception {
		List<TableColumnsVO> result = tableColumnsClient0DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient0DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS1TableColumnsList(TableColumnsVO searchVO) throws Exception {
		List<TableColumnsVO> result = tableColumnsClient1DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient1DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS2TableColumnsList(TableColumnsVO searchVO) throws Exception {
		List<TableColumnsVO> result = tableColumnsClient2DAO.selectTableColumnsList(searchVO);
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
