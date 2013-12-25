
<%@ page import="com.jpos.TkeluarBarangHd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-tkeluarBarangHd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-tkeluarBarangHd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tkeluarBarangHd">
			
				<g:if test="${tkeluarBarangHdInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="tkeluarBarangHd.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="mcustomer" action="show" id="${tkeluarBarangHdInstance?.customer?.id}">${tkeluarBarangHdInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tkeluarBarangHdInstance?.keluardt}">
				<li class="fieldcontain">
					<span id="keluardt-label" class="property-label"><g:message code="tkeluarBarangHd.keluardt.label" default="Keluardt" /></span>
					
						<g:each in="${tkeluarBarangHdInstance.keluardt}" var="k">
						<span class="property-value" aria-labelledby="keluardt-label"><g:link controller="tkeluarBarangDt" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tkeluarBarangHdInstance?.pembuat}">
				<li class="fieldcontain">
					<span id="pembuat-label" class="property-label"><g:message code="tkeluarBarangHd.pembuat.label" default="Pembuat" /></span>
					
						<span class="property-value" aria-labelledby="pembuat-label"><g:link controller="mlogin" action="show" id="${tkeluarBarangHdInstance?.pembuat?.id}">${tkeluarBarangHdInstance?.pembuat?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tkeluarBarangHdInstance?.tanggalKeluar}">
				<li class="fieldcontain">
					<span id="tanggalKeluar-label" class="property-label"><g:message code="tkeluarBarangHd.tanggalKeluar.label" default="Tanggal Keluar" /></span>
					
						<span class="property-value" aria-labelledby="tanggalKeluar-label"><g:formatDate date="${tkeluarBarangHdInstance?.tanggalKeluar}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tkeluarBarangHdInstance?.id}" />
					<g:link class="btn btn-primary" action="edit" id="${tkeluarBarangHdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
