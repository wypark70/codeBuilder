package egovframework.codebuilder.service;

import java.util.Map;

import egovframework.codebuilder.vo.TableColumnsVO;

public interface TableColumnsService {

	public Map<String, Object> selectDS0TableColumnsList(TableColumnsVO searchVO) throws Exception;

	public Map<String, Object> selectDS1TableColumnsList(TableColumnsVO searchVO) throws Exception;

	public Map<String, Object> selectDS2TableColumnsList(TableColumnsVO searchVO) throws Exception;

}
