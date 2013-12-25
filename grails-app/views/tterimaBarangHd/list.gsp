
<%@ page import="com.jpos.TterimaBarangHd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-tterimaBarangHd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-tterimaBarangHd" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tterimaBarangHd.pembuat.label" default="Pembuat" /></th>
					
						<th><g:message code="tterimaBarangHd.supplier.label" default="Supplier" /></th>
					
						<g:sortableColumn property="tanggalTerima" title="${message(code: 'tterimaBarangHd.tanggalTerima.label', default: 'Tanggal Terima')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tterimaBarangHdInstanceList}" status="i" var="tterimaBarangHdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tterimaBarangHdInstance.id}">${fieldValue(bean: tterimaBarangHdInstance, field: "pembuat")}</g:link></td>
					
						<td>${fieldValue(bean: tterimaBarangHdInstance, field: "supplier")}</td>
					
						<td><g:formatDate date="${tterimaBarangHdInstance.tanggalTerima}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tterimaBarangHdInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
