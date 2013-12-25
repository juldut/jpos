
<%@ page import="com.jpos.TkeluarBarangHd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-tkeluarBarangHd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		
		<div id="list-tkeluarBarangHd" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tkeluarBarangHd.customer.label" default="Customer" /></th>
					
						<th><g:message code="tkeluarBarangHd.pembuat.label" default="Pembuat" /></th>
					
						<g:sortableColumn property="tanggalKeluar" title="${message(code: 'tkeluarBarangHd.tanggalKeluar.label', default: 'Tanggal Keluar')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tkeluarBarangHdInstanceList}" status="i" var="tkeluarBarangHdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tkeluarBarangHdInstance.id}">${fieldValue(bean: tkeluarBarangHdInstance, field: "customer")}</g:link></td>
					
						<td>${fieldValue(bean: tkeluarBarangHdInstance, field: "pembuat")}</td>
					
						<td><g:formatDate date="${tkeluarBarangHdInstance.tanggalKeluar}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tkeluarBarangHdInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
