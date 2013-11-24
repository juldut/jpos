<%@ page import="com.jpos.TterimaBarangHd" %>



%{-- 
<div class="fieldcontain ${hasErrors(bean: tterimaBarangHdInstance, field: 'lpbdt', 'error')} ">
	<label for="lpbdt">
		<g:message code="tterimaBarangHd.lpbdt.label" default="Lpbdt" />
		
	</label>
	<g:select name="lpbdt" from="${com.jpos.TterimaBarangDt.list()}" multiple="multiple" optionKey="id" size="5" value="${tterimaBarangHdInstance?.lpbdt*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tterimaBarangHdInstance, field: 'pembuat', 'error')} required">
	<label for="pembuat">
		<g:message code="tterimaBarangHd.pembuat.label" default="Pembuat" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pembuat" name="pembuat.id" from="${com.jpos.Mlogin.list()}" optionKey="id" required="" value="${tterimaBarangHdInstance?.pembuat?.id}" class="many-to-one"/>
</div>
--}%
 
<div class="fieldcontain ${hasErrors(bean: tterimaBarangHdInstance, field: 'supplier', 'error')} required">
	<label for="supplier">
		<g:message code="tterimaBarangHd.supplier.label" default="Supplier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="supplier" name="supplier.id" from="${com.jpos.Msupplier.list()}" optionKey="id" required="" value="${tterimaBarangHdInstance?.supplier?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tterimaBarangHdInstance, field: 'tanggalTerima', 'error')} required">
	<label for="tanggalTerima">
		<g:message code="tterimaBarangHd.tanggalTerima.label" default="Tanggal Terima" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="tanggalTerima" precision="day"  value="${tterimaBarangHdInstance?.tanggalTerima}"  />
</div>

<div class="fieldcontain">
	<table id="tblDetail" width="100%">
		<tr>
			<th>No.</th>
			<th>Nama Barang</th>
			<th>Jumlah</th>
			<th>Harga</th>
			<th>Subtotal</th>
			<th></th>
		</tr>
%{-- 		<g:each in="${salesOrderHdInstance?.sodt}" var="h" status="i">
			<tr>
				<td>${i}</td>
				<td>${h?.namaBarang}</td>
				<td>${h?.jumlahBarang}</td>
				<td>${h?.hargaBarang}</td>
				<td>${h?.hargaBarang * h?.jumlahBarang}</td>
				<td><div class="delete">Del</div></td>
			</tr>
		</g:each>
 --}%
		<tr>
			<td></td>
			<td><input type="text" name="namaBarangInput" id="namaBarangInput"></td>
			<td><input type="text" name="jumlahBarangInput" id="jumlahBarangInput"></td>
			<td><input type="text" name="hargaBarangInput" id="hargaBarangInput"></td>
			<td><input type="button" onclick="tambahBarang()" value="Add"></td>
			<td></td>
		</tr>

	</table>

</div>

<script type="text/javascript">

	$(document).ready(function() {
		$("#namaBarangInput").autocomplete({
			source:"${createLink(controller:'Mbarang', action: 'autocomplete')}",
		});
	});

	function tambahBarang() {

		var tblDetail = document.getElementById("tblDetail");

		var barisTerakhir = tblDetail.rows.length - 1;
		if (barisTerakhir < 0) barisTerakhir = 0;
		var tempRow = tblDetail.insertRow(barisTerakhir);
		
		var cellNo = tempRow.insertCell(0);
		var cellNamaBarang = tempRow.insertCell(1);
		var cellJumlahBarang = tempRow.insertCell(2);
		var cellHargaBarang = tempRow.insertCell(3);
		var cellSubtotal = tempRow.insertCell(4);
		var cellAction = tempRow.insertCell(5);

		cellNo.innerHTML = barisTerakhir;
		cellNamaBarang.innerHTML = "<input type='text' readonly name='namaBarang' value='" + document.getElementById("namaBarangInput").value + "'>";
		cellJumlahBarang.innerHTML = "<input type='text' readonly name='jumlahBarang' value='" + document.getElementById("jumlahBarangInput").value + "'>";
		cellHargaBarang.innerHTML = "<input type='text' readonly name='hargaBarang' value='" + document.getElementById("hargaBarangInput").value + "'>";
		cellAction.innerHTML = "<input type='button' onclick='hapusBarang(" + barisTerakhir + ")' value='-'>";

		document.getElementById("namaBarangInput").value = "";
		document.getElementById("jumlahBarangInput").value = "";
		document.getElementById("hargaBarangInput").value = "";
		document.getElementById("namaBarangInput").select();

	}
	function hapusBarang(paramBaris) {
		var tblDetail = document.getElementById("tblDetail");
		tblDetail.deleteRow(paramBaris);

		for (i=1; i<tblDetail.rows.length - 1; i++) {
			tblDetail.rows[i].cells[0].innerHTML = i;
			tblDetail.rows[i].cells[5].innerHTML = "<input type='button' onclick='hapusBarang(" + i + ")' value='-'>";;
		}

		document.getElementById("namaBarangInput").select();
	}
</script>