
<%@ page import="com.jpos.Mbarang" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mbarang.label', default: 'Mbarang')}" />
		<title>Cek Stok Barang</title>
	</head>
	<body>
		<a href="#list-mbarang" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mbarang" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="barcode" title="${message(code: 'mbarang.barcode.label', default: 'Barcode')}" />
					
						<g:sortableColumn property="harga_beli" title="${message(code: 'mbarang.harga_beli.label', default: 'Harga Beli')}" />
					
						<g:sortableColumn property="harga_jual" title="${message(code: 'mbarang.harga_jual.label', default: 'Harga Jual')}" />
					
						<g:sortableColumn property="nama" title="${message(code: 'mbarang.nama.label', default: 'Nama')}" />

						<th>Stok</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mbarangInstanceList}" status="i" var="mbarangInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mbarangInstance.id}">${mbarangInstance?.barcode}</g:link></td>
					
						<td><g:formatNumber number="${mbarangInstance?.harga_beli}" format="###,###.00" /></td>
					
						<td><g:formatNumber number="${mbarangInstance?.harga_jual}" format="###,###.00" /></td>
					
						<td>${mbarangInstance?.nama}</td>

						<td>${mbarangInstance?.stok}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			%{-- <div class="pagination">
				<g:paginate total="${mbarangInstanceTotal}" />
			</div> --}%
		</div>
	</body>
</html>
