package egovframework.codebuilder.service;

import java.util.Map;

import egovframework.codebuilder.vo.ColumnsSearchVO;

public interface ColumnsService {

	public Map<String, Object> selectDS0TableColumnsList(ColumnsSearchVO searchVO) throws Exception;

	public Map<String, Object> selectDS1TableColumnsList(ColumnsSearchVO searchVO) throws Exception;

	public Map<String, Object> selectDS2TableColumnsList(ColumnsSearchVO searchVO) throws Exception;

	public Map<String, Object> executeQuery(String sqlStr) throws Exception;

}
