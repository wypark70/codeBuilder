package egovframework.codebuilder.vo;

import egovframework.com.cmm.PageVO;
import net.sf.json.JSONObject;

public class TablesSearchVO extends PageVO {
	private String tableName;
	private String tableComments;

	@Override
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableComments() {
		return tableComments;
	}

	public void setTableComments(String tableComments) {
		this.tableComments = tableComments;
	}
}
