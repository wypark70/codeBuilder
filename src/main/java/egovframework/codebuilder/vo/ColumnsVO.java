package egovframework.codebuilder.vo;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class ColumnsVO implements Serializable {
	private static final long serialVersionUID = 5685068431612147862L;

	private String columnName;
	private String columnComments;
	private String dataType;
	private String dataLength;
	private String nullable;
	private int columnId;
	private String primaryKeyYn;

	@Override
	public String toString() {
		return JSONObject.fromObject(this).toString();
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

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getDataLength() {
		return dataLength;
	}

	public void setDataLength(String dataLength) {
		this.dataLength = dataLength;
	}

	public String getNullable() {
		return nullable;
	}

	public void setNullable(String nullable) {
		this.nullable = nullable;
	}

	public int getColumnId() {
		return columnId;
	}

	public void setColumnId(int columnId) {
		this.columnId = columnId;
	}

	public String getPrimaryKeyYn() {
		return primaryKeyYn;
	}

	public void setPrimaryKeyYn(String primaryKeyYn) {
		this.primaryKeyYn = primaryKeyYn;
	}

}
