<%@ page import="com.jpos.TkeluarBarangHd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tkeluarBarangHd.label', default: 'Penjualan')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>
%{-- 		<a href="#create-tkeluarBarangHd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="create-tkeluarBarangHd" class="content scaffold-create" role="main">
			<h1>
				<g:message code="default.create.label" args="[entityName]" />

			</h1>
			<g:if test="${flash.message}">
			<div class="alert alert-danger" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${tkeluarBarangHdInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${tkeluarBarangHdInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" class="form-horizontal">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
