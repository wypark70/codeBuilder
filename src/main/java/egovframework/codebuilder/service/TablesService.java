package egovframework.codebuilder.service;

import java.util.Map;

import egovframework.codebuilder.vo.TablesVO;

public interface TablesService {

	public Map<String, Object> selectDS0TablesList(TablesVO searchVO) throws Exception;

	public Map<String, Object> selectDS1TablesList(TablesVO searchVO) throws Exception;

	public Map<String, Object> selectDS2TablesList(TablesVO searchVO) throws Exception;

}
