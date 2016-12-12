package egovframework.com.cmm.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

public abstract class EgovClient1AbstractDAO extends EgovAbstractDAO {

	@Resource(name = "sqlMapClient1")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSuperSqlMapClient(sqlMapClient);
	}

}
