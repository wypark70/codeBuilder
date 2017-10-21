<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.selectTd {background: #775577 !important;}

#queryTabs .CodeMirror {font-family: D2Coding; font-weight: bold; height: 300px;}
#queryTabs .cm-tab {
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
	background-position: right;
	background-repeat: no-repeat;
}
#queryTabs .tableDiv {padding: 10px 0px 0px 0px !important;}
#queryTabs .codeMirrorDiv {padding: 0px 0px 0px 0px !important;}
#queryTabs .codeMirrorTextarea {width: 100%; height: 300px;}

#resultTabs .CodeMirror {font-family: D2Coding; font-weight: bold; height: 600px;}
#resultTabs .cm-tab {
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
	background-position: right;
	background-repeat: no-repeat;
}
#resultTabs .codeMirrorDiv {padding: 0px 0px 0px 0px !important;}
#resultTabs .codeMirrorTextarea {width: 100%; height: 600px;}

th {font-size: 12px;}
td {font-size: 12px;}

::-webkit-scrollbar {width: 12px;}
::-webkit-scrollbar-track {-webkit-box-shadow: inset 0 0 6px rgb(100,100,100); border-radius: 10px;}
::-webkit-scrollbar-thumb {border-radius: 10px; -webkit-box-shadow: inset 0 0 6px rgb(300,300,300);}
</style>

<section id="tableList" class="features">
	<div class="container">
		<div class="row">
			<div id="queryTabs">
				<ul>
					<li id="table"><a href="#tableDiv">Table List</a></li>
					<li id="query"><a href="#queryDiv">Execute SQL</a></li>
				</ul>
				<div id="tableDiv" class="tableDiv">
					<table id="tablesList" class="nowrap table table-striped table-bordered bootstrap-datatable">
						<thead>
							<tr>
								<th>Name</th>
								<th>Comments</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tablesVO" items="${result.resultList}" varStatus="status">
							<tr>
								<td>${tablesVO.tableName}</td>
								<td>${tablesVO.tableComments}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="queryDiv" class="codeMirrorDiv">
					<textarea class="codeMirrorTextarea" id="queryTextarea" data-key="query" data-mode="text/x-plsql"></textarea>
					<nav class="navbar navbar-default" style="margin-bottom: 0px;">
						<div class="container-fluid">
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<form id="executeSqlForm" name="executeSqlForm" class="navbar-form navbar-right" action="<c:url value="/codebuilder/selectDS2TableColumnsListJsonBySQL.do" />" method="post">
									<div class="form-group">
										<input type="text" id="tableName" name="tableName" class="form-control" placeholder="tableName" />
										<input type="text" id="tableComments" name="tableComments" class="form-control" placeholder="tableComments" />
										<input id="sql" name="sql" type="hidden" />
									</div>
									<button id="executeSqlBtn" type="button" class="btn btn-default">Submit</button>
								</form>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="queryResult" class="features">
	<div class="container">
		<div class="row">
			<div id="queryResultDiv"></div>
		</div>
	</div>
</section>

<section id="resultCode" class="features">
	<div class="container">
		<div class="row">
			<form class="form-inline" action="<c:url value="/codebuilder/saveAsFile.do" />" name="saveAsFileForm" id="saveAsFileForm" method="post">
				<div>
					<div class="form-group">
						<label for="packageName" title="Package name">Package name: </label>
						<input id="packageName" name="packageName" class="form-control" type="text" value="" />
					</div>
					<div class="form-group">
						<label for="rootFolder" title="Root folder">Root folder: </label>
						<input id="rootFolder" name="rootFolder" class="form-control" type="text" value="D://codebuilderOutput" />
					</div>
					<button id="saveAsFileBtn" class="form-control" type="button">Save as files</button>
				</div>
				<input type="hidden" id="pascalTableName" name="pascalTableName" />
				<input type="hidden" id="voString" name="voString" />
				<input type="hidden" id="searchVoString" name="searchVoString" />
				<input type="hidden" id="daoString" name="daoString" />
				<input type="hidden" id="sqlMapString" name="sqlMapString" />
				<input type="hidden" id="serviceString" name="serviceString" />
				<input type="hidden" id="serviceImplString" name="serviceImplString" />
				<input type="hidden" id="controllerString" name="controllerString" />
			</form>
			<br />
			<div id="resultTabs">
				<ul>
					<li id="vo"><a href="#voDiv">vo</a></li>
					<li id="searchVo"><a href="#searchVoDiv">searchVo</a></li>
					<li id="dao"><a href="#daoDiv">dao</a></li>
					<li id="sqlMap"><a href="#sqlMapDiv">sqlmap</a></li>
					<li id="service"><a href="#serviceDiv">service</a></li>
					<li id="serviceImpl"><a href="#serviceImplDiv">serviceImpl</a></li>
					<li id="controller"><a href="#controllerDiv">contrroller</a></li>
					<li id="listJsp"><a href="#listJspDiv">listJsp</a></li>
					<li id="template"><a href="#templateDiv">template</a></li>
				</ul>
				<div id="voDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="voTextarea" data-key="vo" data-mode="text/x-java"></textarea></div>
				<div id="searchVoDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="searchVoTextarea" data-key="searchVo" data-mode="text/x-java"></textarea></div>
				<div id="daoDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="daoTextarea" data-key="dao" data-mode="text/x-java"></textarea></div>
				<div id="sqlMapDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="sqlMapTextarea" data-key="sqlMap" data-mode="htmlmixed"></textarea></div>
				<div id="serviceDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="serviceTextarea" data-key="service" data-mode="text/x-java"></textarea></div>
				<div id="serviceImplDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="serviceImplTextarea" data-key="serviceImpl" data-mode="text/x-java"></textarea></div>
				<div id="controllerDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="controllerTextarea" data-key="controller" data-mode="text/x-java"></textarea></div>
				<div id="listJspDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="listJspTextarea" data-key="listJsp" data-mode="htmlmixed"></textarea></div>
				<div id="templateDiv" class="codeMirrorDiv"><textarea class="codeMirrorTextarea" id="templateTextarea" data-key="template" data-mode="htmlmixed"></textarea></div>
			</div>
		</div>
	</div>
</section>

<section id="elfinder" class="features">
	<div class="container">
		<div class="row">
			<div id="elfinderDiv"></div>
		</div>
	</div>
</section>

<script type="text/javascript">
$(function() {
	var contextPath = "${pageContext.request.contextPath}";
	var editor = new Object();
	var $queryTabs = $("#queryTabs");
	var $resultTabs = $("#resultTabs");
	var $executeSqlForm = $('#executeSqlForm');
	var $queryResultDiv = $("#queryResultDiv");

	$('#elfinderDiv').elfinder({
		url: '<c:url value="/elfinder/connector" />',
		lang: 'ko'
	});

	$queryTabs.tabs({
		activate: function(event, ui) {
			var tabId = $(ui.newTab).attr("id");
			if (editor[tabId]) editor[tabId].refresh();
		}
	});

	$resultTabs.tabs({
		/* event: "mouseover", */
		activate: function(event, ui) {
			var tabId = $(ui.newTab).attr("id");
			if (editor[tabId]) editor[tabId].refresh();
		}
	});

	/*
	$resultTabs.find(".ui-tabs-nav").sortable({
		axis: "x",
		stop: function() {
			$resultTabs.tabs("refresh");
		}
	});
	*/

	var tableInfoDataTable = $('#tablesList').DataTable({
		"lengthMenu": [5, 10, 25, 50, 100],
		"pageLength": 5,
		"paging": true,
		"ordering": true,
		"order": [],
		"info": true,
		"fnDrawCallback": function() {},
		"columnDefs": [
			{"targets": [], "visible": true, "searchable": true}
		]
	});

	$("#tablesList.table > tbody > tr:first").trigger("click");

	var mixedMode = {
		name: "htmlmixed",
		scriptTypes: [
			{matches: /\/x-handlebars-template|\/x-mustache/i, mode: null},
			{matches: /(text|application)\/(x-)?vb(a|script)/i, mode: "vbscript"}
		]
	};

	$(".codeMirrorTextarea").each(function() {
		var data = $(this).data();
		if (data.key == 'query') {
			editor[data.key] = CodeMirror.fromTextArea(this, {
				lineNumbers: true,
				tabSize: 4,
				indentUnit: 4,
				indentWithTabs: true,
				matchBrackets: true,
				selectionPointer: true,
				theme: "xq-dark",
				extraKeys: {"Ctrl-Enter": function() {
						$("#executeSqlBtn").trigger("click");
					}
				},
				//scrollbarStyle: "simple",
				mode: data.mode === "htmlmixed" ? mixedMode : data.mode
			});
		}
		else {
			editor[data.key] = CodeMirror.fromTextArea(this, {
				lineNumbers: true,
				tabSize: 4,
				indentUnit: 4,
				indentWithTabs: true,
				matchBrackets: true,
				selectionPointer: true,
				//scrollbarStyle: "simple",
				theme: "xq-dark",
				mode: data.mode === "htmlmixed" ? mixedMode : data.mode
			});
		}
	});

	setCode("query", {});

	$executeSqlForm.ajaxForm({
		success: function(result) {
			var tableName = result.searchVO.tableName.toLowerCase() || "execute_query_tab";
			var tableComments = result.searchVO.tableComments || "쿼리문실행";
			var packageName = $("#packageName").val() || "bootcms.extension.shcadmin";
			$("#packageName").val(packageName);
			$("#pascalTableName").val(pascalCasing(tableName));
			var resultList = result.tableColumnsVOList;
			if (result.message == "FAIL") {
				$queryResultDiv.empty();
				$queryResultDiv.append('<p>' + result.errorMessage + '</p>');
				$queryResultDiv.append('<pre>' + result.errorStacTraceString + '</pre>');
				$(".codeMirrorTextarea", $resultTabs).each(function() {
					var data = $(this).data();
					editor[data.key].setValue("");
				});
				return false;
			}
			if (!resultList || resultList.length < 1) {
				$queryResultDiv.empty();
				$queryResultDiv.append('<p>Resultset 결과가 없습니다.</p>');
				$(".codeMirrorTextarea", $resultTabs).each(function() {
					var data = $(this).data();
					editor[data.key].setValue("");
				});
				return false;
			}
			var tmpObj = {
				"jstlSt": "\$\{",
				"jstlEd": "\}",
				"packageName": packageName,
				"tableName": tableName.toLowerCase(),
				"tableComments": tableComments,
				"pascalTableName": pascalCasing(tableName),
				"camelTableName": camelCasing(tableName),
				"colArr": new Array(),
				"primaryKeyArr": new Array()
			};
			resultList.forEach(function(v, i) {
				var newObj = {
					columnName: v.columnName.toLowerCase(),
					columnComments: v.columnComments ? v.columnComments.replace(/\s/gi, "") : "",
					camelColumnName: camelCasing(v.columnName),
					pascalColumnName: pascalCasing(v.columnName),
					javaDataType: getJavaType(v.dataType),
					dbDataType: v.dataType,
					dataLength: v.dataLength,
					jstlValStr: "\$\{" + tmpObj.camelTableName + "VO." + camelCasing(v.columnName) + "\}"
				};
				tmpObj.colArr.push(newObj);
				if('Y' === v.primaryKeyYn) {
					tmpObj.primaryKeyArr.push(newObj);
				}
			});
			$(".codeMirrorTextarea", $resultTabs).each(function() {
				var data = $(this).data();
				setCode(data.key, tmpObj);
			});

			var $queryResultTable = $('<table id="queryResultTable" class="nowrap table table-striped table-bordered bootstrap-datatable"></table>');
			$queryResultDiv.empty();
			$queryResultDiv.append($queryResultTable);
			$queryResultTable.DataTable({
				"destroy": true,
				"data": result.resultDataList,
				"scrollX": true,
				"scrollY": "300px",
				"order": [],
				"columns": result.columnMapList
			});
		},
		dataType: "json"
	});

	$("#executeSqlBtn").click(function() {
		var lineNo = editor["query"].getCursor().line + 1;
		var queryStr = editor["query"].getValue();
		if (queryStr && queryStr.length > 0) {
			var queryArr = queryStr.split(/\;/);
			var tmpLineNo = 1;
			for(var i in queryArr) {
				tmpLineNo += (queryArr[i].split(/\n/).length - 1);
				console.log("tmpLine: " + tmpLineNo);
				console.log("lineNo: " + lineNo);
				console.log("query: " + queryArr[i]);
				if (tmpLineNo >= lineNo) {
					$("#sql", $executeSqlForm).val(queryArr[i]);
					$executeSqlForm.submit();
					break;
				}
			}
		}
		else {
			alert("쿼리문은 작성하세요.");
		}
	});

	$('#saveAsFileForm').ajaxForm({
		success: function(result) {
			alert(result.message);
		}
	});

	$("#saveAsFileBtn").click(function() {
		$(".codeMirrorTextarea").each(function() {
			var data = $(this).data();
			$("#" + data.key + "String").val(editor[data.key].getValue());
		});
		$("#saveAsFileForm").submit();
	});
	
	$('#tablesList tbody').on('click', 'tr', function () {
		$(".selectTd", "#tablesList.table > tbody > tr").removeClass("selectTd");
		$("td", this).addClass("selectTd");
		var data = tableInfoDataTable.row(this).data();
		codebuilder(data);
	});

	$("#tablesList.table > tbody > tr:first").trigger("click");

	function codebuilder(data) {
		var tableName = data[0];
		var tableComments = data[1];

		$.ajax({
			method: "POST",
			url: "<c:url value="/codebuilder/selectDS1TableColumnsListJson.do" />",
			data: {tableName: tableName},
			dataType: "json"
		}).done(function(msg) {
			var tableName = msg.searchVO.tableName.toLowerCase();
			var packageName = $("#packageName").val() || "bootcms.extension.shcadmin";
			$("#packageName").val(packageName);
			$("#pascalTableName").val(pascalCasing(tableName));
			var resultList = msg.resultList;
			var tmpObj = {
				"jstlSt": "\$\{",
				"jstlEd": "\}",
				"packageName": packageName,
				"tableName": tableName.toLowerCase(),
				"tableComments": tableComments,
				"pascalTableName": pascalCasing(tableName),
				"camelTableName": camelCasing(tableName),
				"colArr": new Array(),
				"primaryKeyArr": new Array()
			};
			resultList.forEach(function(v, i) {
				var newObj = {
					columnName: v.columnName.toLowerCase(),
					columnComments: v.columnComments ? v.columnComments.replace(/\s/gi, "") : "",
					camelColumnName: camelCasing(v.columnName),
					pascalColumnName: pascalCasing(v.columnName),
					javaDataType: getJavaType(v.dataType),
					dbDataType: v.dataType,
					dataLength: v.dataLength,
					jstlValStr: "\$\{" + tmpObj.camelTableName + "VO." + camelCasing(v.columnName) + "\}"
				};
				tmpObj.colArr.push(newObj);
				if('Y' === v.primaryKeyYn) {
					tmpObj.primaryKeyArr.push(newObj);
				}
			});
			$(".codeMirrorTextarea", $resultTabs).each(function() {
				var data = $(this).data();
				setCode(data.key, tmpObj);
			});
		});
	}

	function camelCasing(columnName) {
		var tmpArr = columnName.toLowerCase().split(/_/);
		tmpArr.forEach(function(v, i) {
			if (i > 0) {
				tmpArr[i] = v.substr(0, 1).toUpperCase() + v.substr(1);
			}
		});
		return tmpArr.join(''); 
	}

	function pascalCasing(columnName) {
		var tmpArr = columnName.toLowerCase().split(/_/);
		tmpArr.forEach(function(v, i) {
			tmpArr[i] = v.substr(0, 1).toUpperCase() + v.substr(1);
		});
		return tmpArr.join(''); 
	}

	function getJavaType(dataType) {
		var retType = "String";
		if ("NVARCHAR2" === dataType.toUpperCase()) {
			retType = "String";
		}
		else if ("NUMBER" === dataType.toUpperCase()) {
			retType = "Long";
		}
		else if ("DATE" === dataType.toUpperCase()) {
			retType = "Date";
		}
		return retType;
	}

	function formatStr(str, obj) {
		var retStr = str;
		for (key in obj) {
			var regexp = new RegExp("\\%\\{" + key + "\\}", "gi");
			retStr = retStr.replace(regexp, obj[key]);
		}
		return retStr;
	}

	function setCode(key,  d) {
		$.get(contextPath + "/codebuilder/template/hrdnet/" + key + ".txt", function(data) {
			editor[key].setValue(data.process(d));
			//$("#" + key + "Textarea").val(data.process(d));
		}, "text");
	}
});
</script>
