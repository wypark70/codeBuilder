<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />

	<link href="<c:url value="/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/jquery-ui/themes/smoothness/jquery-ui.min.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap-theme.min.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/lib/codemirror.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/theme/base16-dark.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/theme/erlang-dark.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/theme/lesser-dark.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/theme/paraiso-dark.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/theme/xq-dark.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/addon/scroll/simplescrollbars.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/bower_components/codemirror/addon/hint/show-hint.css" />" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="<c:url value="/bower_components/jquery/dist/jquery.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/datatables.net/js/jquery.dataTables.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/jquery-ui/jquery-ui.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/lib/codemirror.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/javascript/javascript.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/htmlmixed/htmlmixed.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/sql/sql.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/clike/clike.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/xml/xml.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/mode/htmlembedded/htmlembedded.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/addon/selection/active-line.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/addon/edit/matchbrackets.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/addon/scroll/simplescrollbars.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/addon/hint/show-hint.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/codemirror/addon/hint/sql-hint.js" />"></script>

	<script type="text/javascript" src="<c:url value="/js/jquery.form.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/bootstrap-filestyle.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/trimpath-template-1.0.38.js" />"></script>

	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/bower_components/elfinder/css/elfinder.min.css" />">
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/bower_components/elfinder/css/theme.css" />">
	<script type="text/javascript" src="<c:url value="/bower_components/elfinder/js/elfinder.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/bower_components/elfinder/js/i18n/elfinder.ko.js" />"></script>
</head>

<body>
	<div class="jumbotron text-center" style="padding: 10px 0 10px 0;">
		<h1>Code Builder V0.1</h1>
		<p>코드 자동 생성 툴 입니다.</p>
	</div>
	<div class="container">
		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>