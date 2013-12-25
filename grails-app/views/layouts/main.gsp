<!DOCTYPE html>
<html lang="en">
	<head>
		<title><g:layoutTitle default="Grails"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css/tbmain', file: 'sticky-footer-navbar.css')}" type="text/css">

		

		<r:require modules="jquery"/>
		<r:require modules="jquery-ui"/>
		<r:require modules="bootstrap"/>

		<g:layoutTitle/>
		<r:layoutResources/>
	</head>

	<body>

	<!-- Wrap all page content here -->
	<div id="wrap">

		<!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					%{-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button> --}%
					<a class="navbar-brand" href="${createLink(uri: '/')}">Jpos</a>
				</div>

				
				<div class="collapse navbar-collapse">
				<sec:ifNotLoggedIn>
					<ul class="nav navbar-nav">
						<li><g:link controller='login' action='auth'>Login</g:link></li>
						<li><a  href="${createLink(uri: '/about')}">About</a></li>
					</ul>

				</sec:ifNotLoggedIn>

				<sec:ifLoggedIn>
					<ul class="nav navbar-nav">
						%{-- <li class="active"><a href="${createLink(uri: '/')}">Home</a></li> --}%



						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Master <b class="caret"></b></a>
							<ul class="dropdown-menu">
								
								
								<li class="dropdown-submenu">
									<a href="#">Barang</a>
									<ul class="dropdown-menu ">
										<li><a href="${createLink(controller:'Mbarang', action:'create')}">New</a></li>
										<li><a href="${createLink(controller:'Mbarang', action:'list')}">List</a></li>
										<li><a href="${createLink(controller:'Mbarang', action:'cekstok')}">Cek Stok</a></li>

										%{-- <li class="divider"></li>
										<li class="nav-header">Nav header</li>
										<li><a href="#">Separated link</a></li>
										<li><a href="#">One more separated link</a></li> --}%

									</ul>
								</li>

								<li class="dropdown-submenu">
									<a href="#">Customer</a>
									<ul class="dropdown-menu">
										<li><a href="${createLink(controller:'Mcustomer', action:'create')}">New</a></li>
										<li><a href="${createLink(controller:'Mcustomer', action:'list')}">List</a></li>
									</ul>
								</li>

								<li class="dropdown-submenu">
									<a href="#">Supplier</a>
									<ul class="dropdown-menu ">
										<li><a href="${createLink(controller:'Msupplier', action:'create')}">New</a></li>
										<li><a href="${createLink(controller:'Msupplier', action:'list')}">List</a></li>
									</ul>
								</li>

							</ul>
						</li>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Transaksi <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">Barang Masuk</li>
								<li><a href="${createLink(controller:'TterimaBarangHd', action:'create')}">Beli</a></li>
								<li><a href="#">Retur Jual</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Barang Keluar</li>
								<li><a href="${createLink(controller:'TkeluarBarangHd', action:'create')}">Jual</a></li>
								<li><a href="#">Retur Beli</a></li>
							</ul>
						</li>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Laporan <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">Barang Masuk</li>
								<li><a href="#">Beli</a></li>
								<li><a href="#">Retur Jual</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Barang Keluar</li>
								<li><a href="#">Jual</a></li>
								<li><a href="#">Retur Beli</a></li>
							</ul>
						</li>

						<li><g:link controller='logout'>Logout</g:link></li>

						<li><a href="${createLink(uri: '/about')}">About</a></li>
						
					</ul>
				</sec:ifLoggedIn>
				</div><!--/.nav-collapse -->


			</div>
		</div>



		<!-- Begin page content -->
		<div class="container">
			%{-- <div class="page-header">
			<h1>Sticky footer with fixed navbar</h1>
			</div> --}%


			<g:if test="${params.controller != null}">

				<ol class="breadcrumb">
					<li><a href="${createLink(controller: params.controller)}">${params.controller}</a></li>
					<li><a href="${createLink(controller: params.controller, action: params.action)}">${params.action}</a></li>
				</ol>
			</g:if>

			<g:layoutBody/>
		</div>
	</div>

    <div id="footer">
      <div class="container">
      	<p class="text-muted credit">
            Env : ${grails.util.GrailsUtil.getEnvironment()}
            <sec:ifLoggedIn>
				- Username : <sec:username/>
            </sec:ifLoggedIn>
        </p>
      </div>
    </div>

		
	<r:layoutResources/>
	</body>
</html>