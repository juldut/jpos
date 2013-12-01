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
	<g:select id="supplier" name="supplier.id" from="${com.jpos.Msupplier.list()}" optionKey="id" required="" value="${tterimaBarangHdInstance?.supplier?.id}" class=''/>
</div>

<div class="fieldcontain ${hasErrors(bean: tterimaBarangHdInstance, field: 'tanggalTerima', 'error')} required">
	<label for="tanggalTerima">
		<g:message code="tterimaBarangHd.tanggalTerima.label" default="Tanggal Terima" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="tanggalTerima" precision="day"  value="${tterimaBarangHdInstance?.tanggalTerima}"  />
</div>

<div id="grandTotal"></div>

<div class="fieldcontain">
	<input type="hidden" name="namaBarang" value="">
	<input type="hidden" name="idBarang" value="">
	<input type="hidden" name="jumlahBarang" value="">
	<input type="hidden" name="hargaBarang" value="">
	

	<table id="tblDetail" class="table table-striped table-hover"><tbody>
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

		<g:each in="${tterimaBarangHdInstance?.lpbdt}" var="h" status="i">
			<tr>
				<td>${i+1}</td>
				<td>
					<input type="text" readonly name="namaBarang" value="${h?.barang.nama}" class='form-control'>
					<input type="hidden" name="idBarang" value="${h?.barang.id}">
				</td>
				<td><input type="text" readonly name="jumlahBarang" value="${fieldValue(bean: h, field: "jumlahBarang")}" class='form-control'></td>
				<td><input type="text" readonly name="hargaBarang" value="${fieldValue(bean: h, field: "hargaBarang")}" class='form-control'></td>
				<td><g:formatNumber number="${h?.jumlahBarang * h?.hargaBarang}" format="###,###.00" /></td>
				<td><button type='button' onclick="hapusBarang(${i+1})" class='btn btn-danger'><span class="glyphicon glyphicon-remove"></span></button></td>
			</tr>
		</g:each>

		<tr>
			<td></td>
			<td>
				<input type="text" name="namaBarangInput" id="namaBarangInput" class='form-control' placeholder="Type Barcode or Item name">
				<input type="hidden" name="idBarangInput" id="idBarangInput">
			</td>
			<td><input type="text" name="jumlahBarangInput" id="jumlahBarangInput" class='form-control'></td>
			<td><input type="text" name="hargaBarangInput" id="hargaBarangInput" class='form-control'></td>
			<td><button type="button" onclick="tambahBarang()"  class='btn btn-default'><span class="glyphicon glyphicon-plus"> Add</span></button></td>
			<td></td>
		</tr>

	</tbody></table>

</div>

<script type="text/javascript">

	$(document).ready(function() {
		$("#namaBarangInput").autocomplete({
			source:"${createLink(controller:'Mbarang', action: 'autocomplete')}",
			select: function(event, ui) {
				document.getElementById("hargaBarangInput").value = ui.item.hargaBeli;
				document.getElementById("idBarangInput").value = ui.item.id;
				document.getElementById("jumlahBarangInput").select();
			},
		});
		
		$("#namaBarangInput").bind( "keydown", function( event ) {
			if (event.keyCode != $.ui.keyCode.ENTER && event.keyCode != $.ui.keyCode.TAB) {
				document.getElementById("idBarangInput").value = "";
			}
		});

		hitungGrandTotal();

	});

	function tambahBarang() {

		if (document.getElementById("idBarangInput").value != "") {
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
			cellNamaBarang.innerHTML = "<input class='form-control' type='text' readonly name='namaBarang' value='" + document.getElementById("namaBarangInput").value + "'>" + "<input type='hidden' name='idBarang' value='" + document.getElementById("idBarangInput").value + "'>";
			cellJumlahBarang.innerHTML = "<input class='form-control' type='text' readonly name='jumlahBarang' value='" + document.getElementById("jumlahBarangInput").value + "'>";
			cellHargaBarang.innerHTML = "<input class='form-control' type='text' readonly name='hargaBarang' value='" + document.getElementById("hargaBarangInput").value + "'>";
			cellAction.innerHTML = "<button class='btn btn-danger' type='button' onclick='hapusBarang(" + barisTerakhir + ")' ><span class='glyphicon glyphicon-remove'></span></button>";

			cellSubtotal.innerHTML = document.getElementById("jumlahBarangInput").value * document.getElementById("hargaBarangInput").value;
			cellSubtotal.innerHTML = numeral(cellSubtotal.innerHTML).format("0,0.00");


			document.getElementById("namaBarangInput").value = "";
			document.getElementById("idBarangInput").value = "";
			document.getElementById("jumlahBarangInput").value = "";
			document.getElementById("hargaBarangInput").value = "";

			hitungGrandTotal();

			document.getElementById("namaBarangInput").select();

		}
		else {
			alert("Kode barang tidak dikenali");
			document.getElementById("namaBarangInput").select();
		}


	}
	function hapusBarang(paramBaris) {
		var tblDetail = document.getElementById("tblDetail");
		tblDetail.deleteRow(paramBaris);

		for (i=1; i<tblDetail.rows.length - 1; i++) {
			tblDetail.rows[i].cells[0].innerHTML = i;
			tblDetail.rows[i].cells[5].innerHTML = "<button class='btn btn-danger' type='button' onclick='hapusBarang(" + i + ")' ><span class='glyphicon glyphicon-remove'></span></button>";
		}

		hitungGrandTotal();

		document.getElementById("namaBarangInput").select();
	}

	function hitungGrandTotal() {
		var tblDetail = document.getElementById("tblDetail");

		tempGt = 0;

		for (i=1; i<tblDetail.rows.length - 1; i++) {
			tempGt += parseFloat(numeral().unformat(tblDetail.rows[i].cells[4].innerHTML));
			
		}

		document.getElementById("grandTotal").innerHTML = "<h1 align='right'>" + numeral(tempGt).format("0,0.00") + "</h1>";

	}
</script>
<g:javascript library="numeral"/>