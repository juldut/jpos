<!DOCTYPE html>
<html>

<head>
	<meta name='layout' content='main' />
	<title><g:message code="springSecurity.denied.title" /></title>
</head>

<body>
	<g:message code="springSecurity.denied.message" /><br/>
	<a href="${createLink(uri: '/')}" >Back to index</a><br/>
	<img src="${resource(dir: 'images', file: 'notauth.png')}">
	
</body>

</html>
