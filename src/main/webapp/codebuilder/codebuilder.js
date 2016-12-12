var editor = [];

$(function() {
	$("#voTextarea").each(function() {
		editor["vo"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			mode: "text/x-java",
			matchBrackets: true
		});
	});
	$("#daoTextarea").each(function() {
		editor["dao"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			mode: "text/x-java",
			matchBrackets: true
		});
	});
	$("#sqlMapTextarea").each(function() {
		editor["sqlMap"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			mode: "text/html",
			matchBrackets: true
		});
	});
	$("#serviceTextarea").each(function() {
		editor["service"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			mode: "text/x-java",
			matchBrackets: true
		});
	});
	$("#serviceImplTextarea").each(function() {
		editor["serviceImpl"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			mode: "text/x-java",
			matchBrackets: true
		});
	});
	$("#controllerTextarea").each(function() {
		editor["controller"] = CodeMirror.fromTextArea(this, {
			lineNumbers: true,
			//mode: "application/x-ejs",
			mode: "text/x-java",
			matchBrackets: true
		});
	});
	
	$( "#tabs").tabs({
		activate: function(event, ui) {
			var tabId = $(ui.newTab).attr("id");
			editor[tabId].refresh();
		}
	});
	
	$("#fileInput").change(function(evt) {
		var file = evt.target.files[0];
		var reader = new FileReader();
		reader.readAsText(file);
		reader.onload = function(event) {
			var fileData = event.target.result;
			editor["vo"].setValue(fileData);
		};
	});

	$("#tablesList.table > tbody > tr:first").trigger("click");
});

function codebuilder(obj) {
	$(".selectTd", "#tablesList.table > tbody > tr").removeClass("selectTd");
	$("td", obj).addClass("selectTd");

	var tableName = $(obj).data().tablename;
	var tableComments = $(obj).data().tablecomments;

	$.ajax({
		method: "POST",
		url: "./selectTableColumnsListJson.do",
		data: {tableName: tableName},
		dataType: "json"
	}).done(function(msg) {
		var tableName = msg.searchVO.tableName.toLowerCase();
		var resultList = msg.resultList;
		var tmpObj = {
			"tableName": tableName.toLowerCase(),
			"tableComments": tableComments,
			"pascalTableName": pascalCasing(tableName),
			"camelTableName": camelCasing(tableName),
			"colArr": new Array()
		};

		resultList.forEach(function(v, i) {
			tmpObj.colArr.push({
				columnName: v.columnName,
				columnComments: v.columnComments,
				camelColumnName: camelCasing(v.columnName),
				pascalColumnName: pascalCasing(v.columnName),
				javaDataType: getJavaType(v.dataType)
			});
		});

		// setVo(tmpObj);
		var promiseVo = new Promise(function(resolve, reject) {
			$.get(contextPath + "/codebuilder/template/hrdnet/vo.txt", "text").done(function(data) {
				resolve(data);
			}).fail(function(error) {
				reject(Error("쫑식이 바보"));
			}).always(function() {
			});
		});
		promiseVo.then(function(data) {
			editor["vo"].getDoc().setValue(data.process(tmpObj));
		}, function(error) {
			console.error(error);
		});
		setDao(tmpObj);
		editor["sqlMap"].getDoc().setValue(getSqlMap(tableName, resultList));
		setService(tmpObj);
		setServiceImpl(tmpObj);
		setController(tmpObj);
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
		retType = "int";
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

function setVo(d) {
	$.get(contextPath + "/codebuilder/template/hrdnet/vo.txt", function(data) {
		editor["vo"].getDoc().setValue(data.process(d));
	}, "text");
}

function setDao(d) {
	$.get(contextPath + "/codebuilder/template/hrdnet/dao.txt", function(data) {
		editor["dao"].getDoc().setValue(data.process(d));
	}, "text");
}

function getSqlMap(tableName, colArr) {
	var tmpArr = [];
	tmpArr.push(formatStr('<select id="%{pascalTableName}DAO.select%{pascalTableName}List" parameterClass="%{camelTableName}VO" resultClass="%{camelTableName}VO">\n', {"pascalTableName": pascalCasing(tableName), "camelTableName": camelCasing(tableName)}));
	colArr.forEach(function(v, i) {
		var isFirstItem = i == 0;
		var isLastItem = i == (colArr.length - 1);
		tmpArr.push((isFirstItem ? "select " : "       ") + v.columnName.toLowerCase() + " \"" + camelCasing(v.columnName) + (isLastItem ? "\"" :  "\",") + (v.columnComments && v.columnComments.length > 0 ? " /* " + v.columnComments + " */" : "") + "\n");
	});
	tmpArr.push("  from " + tableName + "\n");
	var primaryKeyArr = colArr.filter(function (d) {return 'Y' === d.primaryKeyYn});
	primaryKeyArr.forEach(function(v, i) {
		tmpArr.push((i < 1 ? " where " : "       ") + v.columnName.toLowerCase() + " = #" + camelCasing(v.columnName) + "# and\n");
	});
	tmpArr.push(primaryKeyArr && primaryKeyArr.length > 0 ? '       1 = 1\n' : "");
	tmpArr.push('</select>\n');
	tmpArr.push('\n');

	tmpArr.push(formatStr('<select id="%{pascalTableName}DAO.select%{pascalTableName}ListCnt" parameterClass="%{camelTableName}VO" resultClass="java.lang.Integer">\n', {"pascalTableName": pascalCasing(tableName), "camelTableName": camelCasing(tableName)}));
	tmpArr.push('select count(1) "toltalCnt"\n');
	tmpArr.push("  from " + tableName + "\n");
	var primaryKeyArr = colArr.filter(function (d) {return 'Y' === d.primaryKeyYn});
	primaryKeyArr.forEach(function(v, i) {
		tmpArr.push((i < 1 ? " where " : "       ") + v.columnName.toLowerCase() + " = #" + camelCasing(v.columnName) + "# and\n");
	});
	tmpArr.push(primaryKeyArr && primaryKeyArr.length > 0 ? '       1 = 1\n' : "");
	tmpArr.push('</select>\n');
	tmpArr.push('\n');

	tmpArr.push('<update id="' + pascalCasing(tableName) + 'DAO.update' + pascalCasing(tableName) + '" parameterClass="' + camelCasing(tableName) + 'VO">\n');
	tmpArr.push("update " + tableName + "\n");
	colArr.forEach(function(v, i) {
		var isFirstItem = i == 0;
		var isLastItem = i == (colArr.length - 1);
		tmpArr.push((isFirstItem ? "   set " : "       ") + v.columnName.toLowerCase() + " = #" + camelCasing(v.columnName) + "#" + (isLastItem ? "\n" : ",\n"));
	});
	var primaryKeyArr = colArr.filter(function (d) {return 'Y' === d.primaryKeyYn});
	primaryKeyArr.forEach(function(v, i) {
		tmpArr.push((i < 1 ? " where " : "       ") + v.columnName.toLowerCase() + " = #" + camelCasing(v.columnName) + "# and\n");
	});
	tmpArr.push(primaryKeyArr && primaryKeyArr.length > 0 ? '       1 = 1\n' : "");
	tmpArr.push('</update>\n');
	tmpArr.push('\n');

	var tmpColArr = [];
	var tmpVarArr = [];
	colArr.forEach(function(v, i) {
		var isLastItem = i == (colArr.length - 1);
		var isAppendNewLine = (i + 1) % 5 == 0;
		tmpColArr.push(v.columnName.toLowerCase() + (isLastItem ? "" : ",") + (isAppendNewLine ? (isLastItem ? "" : "\n        ") : (isLastItem ? "" : " ")));
		tmpVarArr.push("#" + camelCasing(v.columnName) + "#" + (isLastItem ? "" : ",") + (isAppendNewLine ? (isLastItem ? "" : "\n        ") : (isLastItem ? "" : " ")))
	});
	tmpArr.push('<insert id="' + pascalCasing(tableName) + 'DAO.insert' + pascalCasing(tableName) + '" parameterClass="' + camelCasing(tableName) + 'VO">\n');
	tmpArr.push("insert into " + tableName + "\n");
	tmpArr.push("       (" + tmpColArr.join('') + ")\n");
	tmpArr.push("values (" + tmpVarArr.join('') + ")\n");
	tmpArr.push('</insert>\n');
	tmpArr.push('\n');
	return tmpArr.join('');
}

function setService(d) {
	$.get(contextPath + "/codebuilder/template/hrdnet/service.txt", function(data) {
		editor["service"].getDoc().setValue(data.process(d));
	}, "text");
}

function setServiceImpl(d) {
	$.get(contextPath + "/codebuilder/template/hrdnet/serviceImpl.txt", function(data) {
		editor["serviceImpl"].getDoc().setValue(data.process(d));
	}, "text");
}

function setController(d) {
	$.get(contextPath + "/codebuilder/template/hrdnet/controller.txt", function(data) {
		editor["controller"].getDoc().setValue(data.process(d));
	}, "text");
}