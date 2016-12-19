package egovframework.codebuilder.service.impl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
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
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS1TableColumnsList(TableColumnsVO searchVO) throws Exception {
		List<TableColumnsVO> result = tableColumnsClient1DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient1DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> selectDS2TableColumnsList(TableColumnsVO searchVO) throws Exception {
		List<TableColumnsVO> result = tableColumnsClient2DAO.selectTableColumnsList(searchVO);
		int cnt = tableColumnsClient2DAO.selectTableColumnsListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchVO", searchVO);
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public Map<String, Object> executeQuery(String sqlStr) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		ResultSet resultSet = tableColumnsClient2DAO.executeQuery(sqlStr);

		if (resultSet.next()) {
			ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
			List<TableColumnsVO> tmpMapList = new ArrayList<TableColumnsVO>();
			for (int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
				int colnum = i + 1;
				TableColumnsVO tableColumnsVO = new TableColumnsVO();
				tableColumnsVO.setTableName("TABLE_NAME");
				tableColumnsVO.setTableComments("테이블명");
				tableColumnsVO.setColumnName(resultSetMetaData.getSchemaName(colnum));
				tableColumnsVO.setColumnComments("aaa");
				tableColumnsVO.setDataType(resultSetMetaData.getColumnTypeName(colnum));
				tableColumnsVO.setDataLength(resultSetMetaData.getColumnDisplaySize(colnum) + "");
				tableColumnsVO.setNullable("Y");
				tableColumnsVO.setColumnId(colnum);
				tableColumnsVO.setPrimaryKeyYn("N");

				// System.out.println(">>>>>>> tableColumnsVO: " + tableColumnsVO.toString());
				tmpMapList.add(tableColumnsVO);
			}
			resultMap.put("columnList", tmpMapList);
		}

		resultSet.beforeFirst();
		List<List<String>> tmpList = new ArrayList<List<String>>();
		while (resultSet.next()) {
			ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
			List<String> tmpList2 = new ArrayList<String>();
			for (int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
				int colnum = i + 1;
				tmpList2.add(resultSet.getString(colnum));
			}
			// System.out.println(">>>>>>> tmpMapList: " + tmpList2.toString());
			tmpList.add(tmpList2);
		}
		resultMap.put("dataList", tmpList);

		return resultMap;
	}
}
