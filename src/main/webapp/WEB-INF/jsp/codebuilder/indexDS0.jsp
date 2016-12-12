<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.selectTd {background: #ffeedd !important;}
.codeMirrorDiv {padding: 0px 0px 0px 0px !important;}
.CodeMirror {font-family: 나눔고딕코딩; border: 1px solid #eee; height: 700px;}
.cm-tab {
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
	background-position: right;
	background-repeat: no-repeat;
}
.codeMirrorTextarea {width: 100%; height: 700px;}

</style>

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
<br />
<form action="<c:url value="/codebuilder/saveAsFile.do" />" name="saveAsFileForm" id="saveAsFileForm" method="post">
	package name : <input class="text uniform_on" id="packageName" name="packageName" type="text" value="" />
	<input type="hidden" id="pascalTableName" name="pascalTableName" />
	<input type="hidden" id="voString" name="voString" />
	<input type="hidden" id="searchVoString" name="searchVoString" />
	<input type="hidden" id="daoString" name="daoString" />
	<input type="hidden" id="sqlMapString" name="sqlMapString" />
	<input type="hidden" id="serviceString" name="serviceString" />
	<input type="hidden" id="serviceImplString" name="serviceImplString" />
	<input type="hidden" id="controllerString" name="controllerString" />
	<button id="saveAsFileBtn" type="button">Save as files</button>
</form>
<br />
<div id="tabs">
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
<br />
<br />

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var editor = [];

$(function() {
	$( "#tabs").tabs({
		activate: function(event, ui) {
			var tabId = $(ui.newTab).attr("id");
			editor[tabId].refresh();
		}
	});

	var dataTable = $('#tablesList').DataTable();

	$("#tablesList.table > tbody > tr:first").trigger("click");

	var mixedMode = {
		name: "htmlmixed",
		scriptTypes: [
			{matches: /\/x-handlebars-template|\/x-mustache/i, mode: null},
			{matches: /(text|application)\/(x-)?vb(a|script)/i, mode: "vbscript"}]
	};

	$(".codeMirrorTextarea").each(function() {
		var data = $(this).data();
		console.log(data);
		editor[data.key] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			tabSize: 4,
			indentUnit: 4,
			indentWithTabs: true,
			matchBrackets: true,
			selectionPointer: true,
			scrollbarStyle: "simple",
			mode: data.mode === "htmlmixed" ? mixedMode : data.mode
		});
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
		var data = dataTable.row(this).data();
		codebuilder(data);
	});

	$("#tablesList.table > tbody > tr:first").trigger("click");
});

function codebuilder(data) {
	var tableName = data[0];
	var tableComments = data[1];

	$.ajax({
		method: "POST",
		url: "./selectDS0TableColumnsListJson.do",
		data: {tableName: tableName},
		dataType: "json"
	}).done(function(msg) {
		var tableName = msg.searchVO.tableName.toLowerCase();
		var packageName = $("#packageName").val() || "eduport.lms.back.cpmgnt";
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
				columnComments: v.columnComments,
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
		$(".codeMirrorTextarea").each(function() {
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
	$.get(contextPath + "/codebuilder/template/hrdnet2/" + key + ".txt", function(data) {
		editor[key].setValue(data.process(d));
		//$("#" + key + "Textarea").val(data.process(d));
	}, "text");
}
</script>
