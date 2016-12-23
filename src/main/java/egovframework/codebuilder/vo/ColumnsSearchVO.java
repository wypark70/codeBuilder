package egovframework.codebuilder.vo;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class ColumnsSearchVO implements Serializable {
	private static final long serialVersionUID = 5685068431612147862L;

	private String tableName;
	private String tableComments;
	private String columnName;
	private String columnComments;

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

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnComments() {
		return columnComments;
	}

	public void setColumnComments(String columnComments) {
		this.columnComments = columnComments;
	}

}
