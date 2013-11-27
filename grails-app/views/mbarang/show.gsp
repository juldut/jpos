
<%@ page import="com.jpos.Mbarang" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mbarang.label', default: 'Mbarang')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mbarang" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mbarang" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mbarang">
			
				<g:if test="${mbarangInstance?.barcode}">
				<li class="fieldcontain">
					<span id="barcode-label" class="property-label"><g:message code="mbarang.barcode.label" default="Barcode" /></span>
					
						<span class="property-value" aria-labelledby="barcode-label"><g:fieldValue bean="${mbarangInstance}" field="barcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mbarangInstance?.hargaBeli}">
				<li class="fieldcontain">
					<span id="hargaBeli-label" class="property-label"><g:message code="mbarang.hargaBeli.label" default="Harga Beli" /></span>
					
						<span class="property-value" aria-labelledby="hargaBeli-label"><g:fieldValue bean="${mbarangInstance}" field="hargaBeli"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mbarangInstance?.hargaJual}">
				<li class="fieldcontain">
					<span id="hargaJual-label" class="property-label"><g:message code="mbarang.hargaJual.label" default="Harga Jual" /></span>
					
						<span class="property-value" aria-labelledby="hargaJual-label"><g:fieldValue bean="${mbarangInstance}" field="hargaJual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mbarangInstance?.nama}">
				<li class="fieldcontain">
					<span id="nama-label" class="property-label"><g:message code="mbarang.nama.label" default="Nama" /></span>
					
						<span class="property-value" aria-labelledby="nama-label"><g:fieldValue bean="${mbarangInstance}" field="nama"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mbarangInstance?.id}" />
					<g:link class="edit" action="edit" id="${mbarangInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
