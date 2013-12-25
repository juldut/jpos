<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Jpos</title>
	</head>
	<body>
		<h1>Jpos</h1>

		<div class="row">
			<div class="col-sm-2">
				<a href="${createLink(controller:'TterimaBarangHd', action:'create')}" class="thumbnail">
					<img src="${resource(dir: 'images', file: 'purchase.png')}">
					<center>Transaksi Beli</center>
				</a>

			</div>
		</div>		

	</body>
</html>
