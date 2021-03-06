package egovframework.codebuilder.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.io.StringReader;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.codebuilder.service.ColumnsService;
import egovframework.codebuilder.service.TablesService;
import egovframework.codebuilder.vo.ColumnsSearchVO;
import egovframework.codebuilder.vo.TablesVO;

@Controller
public class CodebuilderController {

	@Resource(name = "tablesService")
	private TablesService tablesService;

	@Resource(name = "tableColumnsService")
	private ColumnsService tableColumnsService;

	@RequestMapping("/codebuilder/indexDS0.do")
	public String indexDS0(@ModelAttribute("searchVO") TablesVO tablesVO, Model model) throws Exception {
		model.addAttribute("result", tablesService.selectDS0TablesList(tablesVO));
		return "codebuilder/indexDS0";
	}

	@RequestMapping("/codebuilder/indexDS1.do")
	public String indexDS1(@ModelAttribute("searchVO") TablesVO tablesVO, Model model) throws Exception {
		model.addAttribute("result", tablesService.selectDS1TablesList(tablesVO));
		return "codebuilder/indexDS1";
	}

	@RequestMapping("/codebuilder/indexDS2.do")
	public String indexDS2(@ModelAttribute("searchVO") TablesVO tablesVO, Model model) throws Exception {
		model.addAttribute("result", tablesService.selectDS2TablesList(tablesVO));
		return "codebuilder/indexDS2";
	}

	@RequestMapping(value = "/codebuilder/saveAsFile.do", method = RequestMethod.POST)
	public String saveAsFile(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		System.out.println(">>>>>>> paramMap: " + paramMap.toString());
		StringBuilder resultStringBuilder = new StringBuilder();
		String rootPath = "D:/codebuildOutput";
		String packagePath = paramMap.get("packageName").replaceAll("\\.", "/");
		String pascalTableName = paramMap.get("pascalTableName");
		String fileName = "";

		try {
			fileName = rootPath + "/" + packagePath + "/vo/" + pascalTableName + "VO.java";
			saveAsFile(paramMap.get("voString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/vo/" + pascalTableName + "SearchVO.java";
			saveAsFile(paramMap.get("searchVoString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/dao/" + pascalTableName + "DAO.java";
			saveAsFile(paramMap.get("daoString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/dao/sqlMap/" + pascalTableName + "DAO.xml";
			saveAsFile(paramMap.get("sqlMapString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/service/" + pascalTableName + "Service.java";
			saveAsFile(paramMap.get("serviceString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/service/impl/" + pascalTableName + "ServiceImpl.java";
			saveAsFile(paramMap.get("serviceImplString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			fileName = rootPath + "/" + packagePath + "/web/" + pascalTableName + "Controller.java";
			saveAsFile(paramMap.get("controllerString"), fileName);
			resultStringBuilder.append(fileName);
			resultStringBuilder.append("\r\n");

			resultStringBuilder.append("파일이 생성 되었습니다.");
		}
		catch (Exception e) {
			resultStringBuilder.append(e.getMessage());
			resultStringBuilder.append("\r\n");
			resultStringBuilder.append(getPrintStacTraceString(e));
			e.printStackTrace();
		}

		model.addAttribute("message", resultStringBuilder.toString());
		return "jsonView";
	}

	private void saveAsFile(String xmlString, String filePath) throws IOException {
		StringReader stringReader = null;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;

		try {
			File file = new File(filePath);
			File path = new File(file.getPath());
			if (!path.exists()) {
				path.mkdirs();
			}
			if (file.exists()) {
				file.delete();
				file.createNewFile();
			}
			else {
				file.createNewFile();
			}
			stringReader = new StringReader(xmlString);
			bufferedReader = new BufferedReader(stringReader);
			bufferedWriter = new BufferedWriter(new FileWriter(file));

			String lineStr = null;
			while ((lineStr = bufferedReader.readLine()) != null) {
				bufferedWriter.write(lineStr);
				bufferedWriter.write("\r\n");
			}
		}
		finally {
			if (bufferedWriter != null) bufferedWriter.close();
			if (bufferedReader != null) bufferedReader.close();
			if (stringReader != null) stringReader.close();
		}
	}

	@RequestMapping(value = "/codebuilder/pageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage) {
		String returnPage = "";
		if (linkPage == null || linkPage.equals("")) {
			returnPage = "cmm/egovError";
		}
		else {
			if (linkPage.indexOf(",") > -1) {
				returnPage = linkPage.substring(0, linkPage.indexOf(","));
			}
			returnPage = "codebuilder/" + linkPage;
		}
		return returnPage;
	}

	@RequestMapping(value = "/codebuilder/htmlPageLink.do")
	public String htmlPageLink(@RequestParam("link") String linkPage) {
		String returnPage = "";
		if (linkPage == null || linkPage.equals("")) {
			returnPage = "cmm/egovError";
		}
		else {
			returnPage = linkPage;
		}
		return returnPage;
	}

	@RequestMapping(value = "/codebuilder/selectDS0TablesListJson.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> selectTablesListJson(@ModelAttribute("searchVO") TablesVO tablesVO) throws Exception {
		Map<String, Object> map = tablesService.selectDS0TablesList(tablesVO);
		return map;
	}

	@RequestMapping(value = "/codebuilder/selectDS1TablesListJson.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> selectDS1TablesListJson(@ModelAttribute("searchVO") TablesVO tablesVO) throws Exception {
		Map<String, Object> map = tablesService.selectDS1TablesList(tablesVO);
		return map;
	}

	@RequestMapping(value = "/codebuilder/selectDS2TablesListJson.do", produces = "text/plain;charset=UTF-8")
	public String selectDS2TablesListJson(@ModelAttribute("searchVO") TablesVO tablesVO, Model model) throws Exception {
		Map<String, Object> map = tablesService.selectDS2TablesList(tablesVO);
		model.addAttribute("searchVO", tablesVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		return "jsonView";
	}

	@RequestMapping(value = "/codebuilder/selectDS0TableColumnsListJson.do")
	public String selectTableColumnsListJson(@ModelAttribute("searchVO") ColumnsSearchVO columnsSearchVO, Model model) throws Exception {
		Map<String, Object> map = tableColumnsService.selectDS0TableColumnsList(columnsSearchVO);
		model.addAttribute("searchVO", columnsSearchVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		return "jsonView";
	}

	@RequestMapping(value = "/codebuilder/selectDS1TableColumnsListJson.do")
	public String selectDS1TableColumnsListJson(@ModelAttribute("searchVO") ColumnsSearchVO columnsSearchVO, Model model) throws Exception {
		Map<String, Object> map = tableColumnsService.selectDS1TableColumnsList(columnsSearchVO);
		model.addAttribute("searchVO", columnsSearchVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		return "jsonView";
	}

	@RequestMapping("/codebuilder/selectDS2TableColumnsListJson.do")
	public String selectDS2TableColumnsListJson(@ModelAttribute("searchVO") ColumnsSearchVO columnsSearchVO, Model model) throws Exception {
		Map<String, Object> map = tableColumnsService.selectDS2TableColumnsList(columnsSearchVO);
		model.addAttribute("searchVO", columnsSearchVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));

		return "jsonView";
	}

	@RequestMapping("/codebuilder/selectDS2TableColumnsListJsonBySQL.do")
	public String selectDS2TableColumnsListJsonBySQL(@ModelAttribute("searchVO") ColumnsSearchVO columnsSearchVO, @RequestParam String sql, Model model) throws Exception {
		Map<String, Object> map = null;
		try {
			map = tableColumnsService.executeQuery(sql);
			model.addAttribute("message", "SUCCESS");
			model.addAttribute("searchVO", columnsSearchVO);
			model.addAttribute("tableColumnsVOList", map.get("tableColumnsVOList"));
			model.addAttribute("columnMapList", map.get("columnMapList"));
			model.addAttribute("resultDataList", map.get("resultDataList"));
		}
		catch (Exception e) {
			model.addAttribute("message", "FAIL");
			model.addAttribute("errorMessage", e.getMessage());
			model.addAttribute("errorStacTraceString", getPrintStacTraceString(e));
		}

		return "jsonView";
	}

	public static String getPrintStacTraceString(Exception e) {
		String returnValue = "";
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		PrintStream printStream = new PrintStream(out);
		e.printStackTrace(printStream);
		returnValue = out.toString();
		return returnValue;
	}
}
