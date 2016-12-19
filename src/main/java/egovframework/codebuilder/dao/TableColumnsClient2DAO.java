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

		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sqlStr, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
				List<TableColumnsVO> tmpMapList = new ArrayList<TableColumnsVO>();
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

					System.out.println(">>>>>>> tableColumnsVO: " + tableColumnsVO.toString());
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
				System.out.println(">>>>>>> tmpMapList: " + tmpList2.toString());
				tmpList.add(tmpList2);
			}
			//resultMap.put("dataList", tmpList);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (resultSet != null) resultSet.close();
			if (preparedStatement != null) preparedStatement.close();
			if (connection != null) connection.close();
		}

		return resultMap;
	}

}
