package egovframework.com.cmm.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

public abstract class EgovClient2AbstractDAO extends EgovAbstractDAO {

	@Resource(name = "sqlMapClient2")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSuperSqlMapClient(sqlMapClient);
	}

}
