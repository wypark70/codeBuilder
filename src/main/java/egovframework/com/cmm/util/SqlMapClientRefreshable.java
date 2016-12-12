package egovframework.com.cmm.util;


public interface SqlMapClientRefreshable {

	void refresh() throws Exception;
	

	void setCheckInterval(int ms);
	
}
