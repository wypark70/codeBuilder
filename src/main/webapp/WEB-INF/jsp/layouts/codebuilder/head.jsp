<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Code Builder - Version 0.1</title>

<!-- Custom Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">

<link href="<c:url value="/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
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

<link href="<c:url value="/bower_components/jquery-ui/themes/dark-hive/jquery-ui.min.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/bower_components/jquery-ui/jquery-ui.min.js" />"></script>

<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/bower_components/elfinder/css/elfinder.min.css" />">
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/bower_components/elfinder/css/theme.css" />">
<script type="text/javascript" src="<c:url value="/bower_components/elfinder/js/elfinder.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/bower_components/elfinder/js/i18n/elfinder.ko.js" />"></script>

<link rel="stylesheet" href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css" />">
<link rel="stylesheet" href="<c:url value="/bower_components/simple-line-icons/css/simple-line-icons.css" />">
<link rel="stylesheet" href="<c:url value="/bower_components/device-mockups/device-mockups.min.css" />">
<link href="<c:url value="/css/new-age.min.css" />" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="<c:url value="/js/new-age.min.js" />"></script>


<%--
<link href="<c:url value="/css/perfect-scrollbar.min.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/perfect-scrollbar.jquery.min.js" />"></script>
 --%>