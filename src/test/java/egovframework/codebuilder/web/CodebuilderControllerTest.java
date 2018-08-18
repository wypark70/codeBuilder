package egovframework.codebuilder.web;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import egovframework.codebuilder.service.TablesService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/test/webapp/WEB-INF/config/egovframework/springmvc/*.xml", "file:src/main/resources/egovframework/spring/com/context-*.xml" })
@WebAppConfiguration
public class CodebuilderControllerTest {

	@Mock
	TablesService tablesService;
	@InjectMocks
	private CodebuilderController codebuilderController;

	private MockMvc mockMvc;

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(codebuilderController).build();
	}

	@Test
	public void test01() throws Exception {
		System.out.println(mockMvc.toString());

	}
}


