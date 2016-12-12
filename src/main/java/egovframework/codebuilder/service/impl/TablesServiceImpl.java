package egovframework.codebuilder.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.codebuilder.dao.TablesClient0DAO;
import egovframework.codebuilder.dao.TablesClient1DAO;
import egovframework.codebuilder.dao.TablesClient2DAO;
import egovframework.codebuilder.service.TablesService;
import egovframework.codebuilder.vo.TablesVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("tablesService")
public class TablesServiceImpl extends EgovAbstractServiceImpl implements TablesService {

	@Resource(name = "tablesClient0DAO")
	private TablesClient0DAO tablesClient0DAO;

	@Resource(name = "tablesClient1DAO")
	private TablesClient1DAO tablesClient1DAO;

	@Resource(name = "tablesClient2DAO")
	private TablesClient2DAO tablesClient2DAO;

	@Override
	public Map<String, Object> selectDS0TablesList(TablesVO searchVO) throws Exception {
		List<TablesVO> result = tablesClient0DAO.selectTablesList(searchVO);
		int cnt = tablesClient0DAO.selectTablesListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS1TablesList(TablesVO searchVO) throws Exception {
		List<TablesVO> result = tablesClient1DAO.selectTablesList(searchVO);
		int cnt = tablesClient1DAO.selectTablesListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS2TablesList(TablesVO searchVO) throws Exception {
		List<TablesVO> result = tablesClient2DAO.selectTablesList(searchVO);
		int cnt = tablesClient2DAO.selectTablesListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
}
