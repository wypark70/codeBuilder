package egovframework.com.cmm.util;

import net.sf.log4jdbc.Slf4jSpyLogDelegator;
import net.sf.log4jdbc.Spy;
import net.sf.log4jdbc.tools.LoggingType;

public class MyLog4JdbcCustomFormatter extends Slf4jSpyLogDelegator {
	private LoggingType loggingType = LoggingType.DISABLED;
	private String margin = "";
	private String sqlPrefix = "SQL:";

	public int getMargin() {
		return this.margin.length();
	}

	public void setMargin(int n) {
		this.margin = String.format("%1$-" + n + "s", " ");
	}

	public String sqlOccured(Spy spy, String methodCall, String rawSql) {
		if (this.loggingType == LoggingType.DISABLED) {
			return "";
		}

		if (this.loggingType != LoggingType.MULTI_LINE) {
			rawSql = rawSql.replaceAll("\r", "");
			rawSql = rawSql.replaceAll("\n", "");
		}
		String sql = rawSql;
		if (this.loggingType == LoggingType.MULTI_LINE) {
			sql = sql.replaceAll("\\s{2,}", " ");
		}
		if ((this.loggingType == LoggingType.SINGLE_LINE_TWO_COLUMNS) && (sql.startsWith("select"))) {
			String from = sql.substring(sql.indexOf(" from ") + " from ".length());
			sql = from + "\t" + sql;
		}

		getSqlOnlyLogger().info(this.sqlPrefix + sql);
		return sql;
	}

	public String sqlOccured(Spy spy, String methodCall, String[] sqls) {
		String s = "";
		for (int i = 0; i < sqls.length; ++i) {
			s = s + sqlOccured(spy, methodCall, sqls[i]) + String.format("%n", new Object[0]);
		}
		return s;
	}

	public LoggingType getLoggingType() {
		return this.loggingType;
	}

	public void setLoggingType(LoggingType loggingType) {
		this.loggingType = loggingType;
	}

	public String getSqlPrefix() {
		return this.sqlPrefix;
	}

	public void setSqlPrefix(String sqlPrefix) {
		this.sqlPrefix = sqlPrefix;
	}
}
