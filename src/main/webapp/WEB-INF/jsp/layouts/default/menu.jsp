<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="sidebar-left" class="span2">
	<div class="nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNINSTTCODE"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNCTSNNMANAGE"><i class="icon-envelope"></i><span class="hidden-tablet"> Messages</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNEMPLYRINFO"><i class="icon-tasks"></i><span class="hidden-tablet"> Tasks</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=LETTNSCHDULINFO"><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=LETTNBBS"><i class="icon-dashboard"></i><span class="hidden-tablet"> Widgets</span></a></li>
			<li><a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Dropdown</span><span class="label label-important"> 3 </span></a>
				<ul>
					<li><a class="submenu" href="${contextPath}/codebuilder/index.do?pid=COMTNINSTTCODERECPTNLOG"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 2</span></a></li>
					<li><a class="submenu" href="${contextPath}/codebuilder/index.do?pid=LETTNFAQINFO"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 3</span></a></li>
					<li><a class="submenu" href="${contextPath}/codebuilder/index.do?pid=COMTNWIKMNTHNGREPRT"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 1</span></a></li>
				</ul>
			</li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNBATCHRESULT"><i class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTHCONFMHISTORY"><i class="icon-list-alt"></i><span class="hidden-tablet"> Charts</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNHTTPMON"><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNUSERLOG"><i class="icon-picture"></i><span class="hidden-tablet"> Gallery</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNLEADERSCHDUL"><i class="icon-align-justify"></i><span class="hidden-tablet"> Tables</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNTROBLINFO"><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNSTSFDG"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTHHTTPMONLOGINFO"><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
			<li><a href="${contextPath}/codebuilder/index.do?pid=COMTNCMMNTYUSER"><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
		</ul>
	</div>
</div>
