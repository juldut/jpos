<!DOCTYPE html>
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	
</head>

<body>

<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='form-horizontal' autocomplete='off'>
			<div class='col-sm-3'>
				<label for='username' class='control-label'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='form-control' name='j_username' id='username'/>
			</div>
			<div class='row'></div>

			<div class='col-sm-3'>
				<label for='password' class='control-label'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='form-control' name='j_password' id='password'/>
			</div>

			<div class='row'></div>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>
			<div class='row'></div>

			<p>
				<input type='submit' class='btn btn-primary' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
