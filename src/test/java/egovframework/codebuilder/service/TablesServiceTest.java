package egovframework.codebuilder.service;

import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import egovframework.codebuilder.vo.TablesVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/test/webapp/WEB-INF/config/egovframework/springmvc/*.xml", "file:src/main/resources/egovframework/spring/com/context-*.xml"})
public class TablesServiceTest {

	@Resource(name = "tablesService")
	private TablesService tablesService;

	@Test
	public void test() throws Exception {
		TablesVO searchVO = new TablesVO();
		searchVO.setTableName(null);
		Map<String, Object> map = tablesService.selectDS2TablesList(searchVO);
		System.out.println(map);
	}

}
