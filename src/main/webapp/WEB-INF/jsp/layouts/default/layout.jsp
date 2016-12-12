<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<tiles:insertAttribute name="header" />
</head>

<body>
<tiles:insertAttribute name="navbar" />

<div class="container-fluid-full">
	<div class="row-fluid">
		<tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="body" />
	</div>
</div>

<div class="modal hide fade" id="myModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">Ã</button>
		<h3>Settings</h3>
	</div>
	<div class="modal-body">
		<p>Here settings can be configured...</p>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">Close</a><a href="#" class="btn btn-primary">Save changes</a>
	</div>
</div>

<div class="clearfix"></div>

<tiles:insertAttribute name="footer" />
<tiles:insertAttribute name="script" />
</body>
</html>
