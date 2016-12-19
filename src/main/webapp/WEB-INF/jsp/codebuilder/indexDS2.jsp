<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.selectTd {background: #ffeedd !important;}
.codeMirrorDiv {padding: 0px 0px 0px 0px !important;}
.CodeMirror {font-family: 나눔고딕코딩; font-weight: bold; border: 1px solid #eee; height: 600px;}
.cm-tab {
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
	background-position: right;
	background-repeat: no-repeat;
}
.codeMirrorTextarea {width: 100%; height: 600px;}
#tablesList th {font-size: 14px;}
#tablesList td {font-size: 12px;}
</style>
<div id="queryTabs">
	<ul>
		<li id="table"><a href="#tableDiv">tableDiv</a></li>
		<li id="query"><a href="#queryDiv">queryDiv</a></li>
	</ul>
	<div id="tableDiv">
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
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>
<br />
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
	<input type="hidden" id="controllerString" name="controllerString" /></form>
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
<br />
<br />

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var editor = new Object();

$(function() {
	var $queryTabs = $( "#queryTabs").tabs({
		activate: function(event, ui) {
			var tabId = $(ui.newTab).attr("id");
			if (editor[tabId]) editor[tabId].refresh();
		}
	});

	var $resultTabs = $( "#resultTabs").tabs({
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

	var dataTable = $('#tablesList').DataTable({
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
		url: "./selectDS2TableColumnsListJson.do",
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
		console.log(JSON.stringify(tmpObj));
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
	$.get(contextPath + "/codebuilder/template/hrdnet/" + key + ".txt", function(data) {
		editor[key].setValue(data.process(d));
		//$("#" + key + "Textarea").val(data.process(d));
	}, "text");
}
</script>
