<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- start: Meta -->
<meta charset="utf-8">
<title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
<meta name="description" content="Bootstrap Metro Dashboard">
<meta name="author" content="Dennis Ji">
<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link id="bootstrap-style" href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${contextPath}/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link id="base-style" href="${contextPath}/css/style.css" rel="stylesheet">
<link id="base-style-responsive" href="${contextPath}/css/style-responsive.css" rel="stylesheet">

<link href="${contextPath}/codemirror/lib/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/codemirror/addon/hint/show-hint.css" />

<!--link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'-->
<!-- end: CSS -->

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<link id="ie-style" href="css/ie.css" rel="stylesheet">
<![endif]-->
<!--[if IE 9]>
	<link id="ie9style" href="css/ie9.css" rel="stylesheet">
<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="${contextPath}/img/favicon.ico">
<!-- end: Favicon -->

<!-- start: JavaScript-->
<script src="${contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${contextPath}/js/jquery-migrate-1.0.0.min.js"></script>
<script src="${contextPath}/js/jquery-ui-1.10.0.custom.min.js"></script>
<script src="${contextPath}/js/jquery.ui.touch-punch.js"></script>
<script src="${contextPath}/js/modernizr.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/jquery.cookie.js"></script>
<script src='${contextPath}/js/fullcalendar.min.js'></script>
<script src='${contextPath}/js/jquery.dataTables.min.js'></script>
<script src='${contextPath}/js/dataTables.bootstrap.min.js'></script>

<script src="${contextPath}/js/excanvas.js"></script>
<script src="${contextPath}/js/jquery.flot.js"></script>
<script src="${contextPath}/js/jquery.flot.pie.js"></script>
<script src="${contextPath}/js/jquery.flot.stack.js"></script>
<script src="${contextPath}/js/jquery.flot.resize.min.js"></script>

<script src="${contextPath}/js/jquery.form.min.js"></script>
<script src="${contextPath}/js/jquery.chosen.min.js"></script>
<script src="${contextPath}/js/jquery.uniform.min.js"></script>
<script src="${contextPath}/js/jquery.cleditor.min.js"></script>
<script src="${contextPath}/js/jquery.noty.js"></script>
<script src="${contextPath}/js/jquery.elfinder.min.js"></script>
<script src="${contextPath}/js/jquery.raty.min.js"></script>
<script src="${contextPath}/js/jquery.iphone.toggle.js"></script>
<script src="${contextPath}/js/jquery.uploadify-3.1.min.js"></script>
<script src="${contextPath}/js/jquery.gritter.min.js"></script>
<script src="${contextPath}/js/jquery.imagesloaded.js"></script>
<script src="${contextPath}/js/jquery.masonry.min.js"></script>
<script src="${contextPath}/js/jquery.knob.modified.js"></script>
<script src="${contextPath}/js/jquery.sparkline.min.js"></script>
<script src="${contextPath}/js/counter.js"></script>
<script src="${contextPath}/js/retina.js"></script>
<script src="${contextPath}/js/custom.js"></script>

<script src="${contextPath}/codemirror/lib/codemirror.js"></script>
<script src="${contextPath}/codemirror/mode/sql/sql.js"></script>
<script src="${contextPath}/codemirror/mode/clike/clike.js"></script>
<script src="${contextPath}/codemirror/mode/xml/xml.js"></script>
<script src="${contextPath}/codemirror/mode/javascript/javascript.js"></script>
<script src="${contextPath}/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="${contextPath}/codemirror/mode/htmlembedded/htmlembedded.js"></script>
<script src="${contextPath}/codemirror/addon/edit/matchbrackets.js"></script>
<script src="${contextPath}/codemirror/addon/hint/show-hint.js"></script>
<script src="${contextPath}/codemirror/addon/hint/sql-hint.js"></script>

<script src="${contextPath}/js/trimpath-template-1.0.38.js"></script>
<!-- end: JavaScript-->