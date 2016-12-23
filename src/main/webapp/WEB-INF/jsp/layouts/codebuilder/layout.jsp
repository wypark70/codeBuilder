<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<tiles:insertAttribute name="head" />
</head>
<body id="page-top">
<%-- 
<tiles:insertAttribute name="bodyNav" />
<tiles:insertAttribute name="bodyHeader" />
 --%>
<tiles:insertAttribute name="body" />
<%-- <tiles:insertAttribute name="bodyFooter" /> --%>
</body>
</html>
