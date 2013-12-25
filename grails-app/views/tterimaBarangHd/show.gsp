
<%@ page import="com.jpos.TterimaBarangHd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-tterimaBarangHd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		
		<div id="show-tterimaBarangHd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tterimaBarangHd">
			
				<g:if test="${tterimaBarangHdInstance?.lpbdt}">
				<li class="fieldcontain">
					<span id="lpbdt-label" class="property-label"><g:message code="tterimaBarangHd.lpbdt.label" default="Lpbdt" /></span>
					
						<g:each in="${tterimaBarangHdInstance.lpbdt}" var="l">
						<span class="property-value" aria-labelledby="lpbdt-label"><g:link controller="tterimaBarangDt" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tterimaBarangHdInstance?.pembuat}">
				<li class="fieldcontain">
					<span id="pembuat-label" class="property-label"><g:message code="tterimaBarangHd.pembuat.label" default="Pembuat" /></span>
					
						<span class="property-value" aria-labelledby="pembuat-label"><g:link controller="mlogin" action="show" id="${tterimaBarangHdInstance?.pembuat?.id}">${tterimaBarangHdInstance?.pembuat?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tterimaBarangHdInstance?.supplier}">
				<li class="fieldcontain">
					<span id="supplier-label" class="property-label"><g:message code="tterimaBarangHd.supplier.label" default="Supplier" /></span>
					
						<span class="property-value" aria-labelledby="supplier-label"><g:link controller="msupplier" action="show" id="${tterimaBarangHdInstance?.supplier?.id}">${tterimaBarangHdInstance?.supplier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tterimaBarangHdInstance?.tanggalTerima}">
				<li class="fieldcontain">
					<span id="tanggalTerima-label" class="property-label"><g:message code="tterimaBarangHd.tanggalTerima.label" default="Tanggal Terima" /></span>
					
						<span class="property-value" aria-labelledby="tanggalTerima-label"><g:formatDate date="${tterimaBarangHdInstance?.tanggalTerima}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form class="form-horizontal">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tterimaBarangHdInstance?.id}" />
					<g:link class="btn btn-primary" action="edit" id="${tterimaBarangHdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
