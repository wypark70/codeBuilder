package egovframework.codebuilder.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import egovframework.codebuilder.vo.TableColumnsVO;
import egovframework.com.cmm.service.impl.EgovClient2AbstractDAO;

@Repository("tableColumnsClient2DAO")
public class TableColumnsClient2DAO extends EgovClient2AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<TableColumnsVO> selectTableColumnsList(TableColumnsVO vo) throws Exception {
		return (List<TableColumnsVO>) list("TableColumnsDAO.selectTableColumnsList", vo);
	}

	public int selectTableColumnsListCnt(TableColumnsVO vo) throws Exception {
		return (Integer) select("TableColumnsDAO.selectTableColumnsListCnt", vo);
	}

	@SuppressWarnings("deprecation")
	public Map<String, Object> executeQuery(String sqlStr) throws Exception {
		DataSource dataSource = getSqlMapClientTemplate().getDataSource();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();

		StringBuilder querySb = new StringBuilder();
		querySb.append("with org_query_tab as (");
		querySb.append(sqlStr);
		querySb.append(") select * from org_query_tab where rownum <= 500");
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(querySb.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
				List<TableColumnsVO> tableColumnsVOList = new ArrayList<TableColumnsVO>();
				List<Map<String, String>> columnMapList = new ArrayList<Map<String, String>>();
				for (int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					int colnum = i + 1;
					TableColumnsVO tableColumnsVO = new TableColumnsVO();
					tableColumnsVO.setTableName("TABLE_NAME");
					tableColumnsVO.setTableComments("테이블명");
					tableColumnsVO.setColumnName(resultSetMetaData.getColumnName(colnum));
					tableColumnsVO.setColumnComments(resultSetMetaData.getColumnName(colnum));
					tableColumnsVO.setDataType(resultSetMetaData.getColumnTypeName(colnum));
					tableColumnsVO.setDataLength(resultSetMetaData.getColumnDisplaySize(colnum) + "");
					tableColumnsVO.setNullable("Y");
					tableColumnsVO.setColumnId(colnum);
					tableColumnsVO.setPrimaryKeyYn("N");
					tableColumnsVOList.add(tableColumnsVO);
					System.out.println(tableColumnsVO.toString());

					Map<String, String> columnMap = new HashMap<String, String>();
					columnMap.put("title", tableColumnsVO.getColumnName());
					columnMapList.add(columnMap);
				}
				resultMap.put("columnMapList", columnMapList);
				resultMap.put("tableColumnsVOList", tableColumnsVOList);
			}

			resultSet.beforeFirst();
			List<List<String>> resultDataList = new ArrayList<List<String>>();
			while (resultSet.next()) {
				ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
				List<String> relultData = new ArrayList<String>();
				for (int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					int colnum = i + 1;
					relultData.add(resultSet.getString(colnum));
				}
				resultDataList.add(relultData);
			}
			resultMap.put("resultDataList", resultDataList);
		}
		finally {
			if (resultSet != null) resultSet.close();
			if (preparedStatement != null) preparedStatement.close();
			if (connection != null) connection.close();
		}

		return resultMap;
	}

}
