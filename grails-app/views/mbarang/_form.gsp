<%@ page import="com.jpos.Mbarang" %>



<div class="fieldcontain ${hasErrors(bean: mbarangInstance, field: 'barcode', 'error')} ">
	<label for="barcode">
		<g:message code="mbarang.barcode.label" default="Barcode" />
		
	</label>
	<g:textField name="barcode" value="${mbarangInstance?.barcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mbarangInstance, field: 'hargaBeli', 'error')} required">
	<label for="hargaBeli">
		<g:message code="mbarang.hargaBeli.label" default="Harga Beli" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hargaBeli" value="${fieldValue(bean: mbarangInstance, field: 'hargaBeli')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: mbarangInstance, field: 'hargaJual', 'error')} required">
	<label for="hargaJual">
		<g:message code="mbarang.hargaJual.label" default="Harga Jual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hargaJual" value="${fieldValue(bean: mbarangInstance, field: 'hargaJual')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: mbarangInstance, field: 'nama', 'error')} ">
	<label for="nama">
		<g:message code="mbarang.nama.label" default="Nama" />
		
	</label>
	<g:textField name="nama" value="${mbarangInstance?.nama}"/>
</div>

