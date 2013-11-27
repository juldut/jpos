<%@ page import="com.jpos.TkeluarBarangHd" %>



<div class="fieldcontain ${hasErrors(bean: tkeluarBarangHdInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="tkeluarBarangHd.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${com.jpos.Mcustomer.list()}" optionKey="id" required="" value="${tkeluarBarangHdInstance?.customer?.id}" class="many-to-one"/>
</div>

%{-- <div class="fieldcontain ${hasErrors(bean: tkeluarBarangHdInstance, field: 'keluardt', 'error')} ">
	<label for="keluardt">
		<g:message code="tkeluarBarangHd.keluardt.label" default="Keluardt" />
		
	</label>
	<g:select name="keluardt" from="${com.jpos.TkeluarBarangDt.list()}" multiple="multiple" optionKey="id" size="5" value="${tkeluarBarangHdInstance?.keluardt*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tkeluarBarangHdInstance, field: 'pembuat', 'error')} required">
	<label for="pembuat">
		<g:message code="tkeluarBarangHd.pembuat.label" default="Pembuat" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pembuat" name="pembuat.id" from="${com.jpos.Mlogin.list()}" optionKey="id" required="" value="${tkeluarBarangHdInstance?.pembuat?.id}" class="many-to-one"/>
</div>
 --}%
<div class="fieldcontain ${hasErrors(bean: tkeluarBarangHdInstance, field: 'tanggalKeluar', 'error')} required">
	<label for="tanggalKeluar">
		<g:message code="tkeluarBarangHd.tanggalKeluar.label" default="Tanggal Keluar" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="tanggalKeluar" precision="day"  value="${tkeluarBarangHdInstance?.tanggalKeluar}"  />
</div>

<div id="grandTotal"></div>

<div class="fieldcontain">
	<input type="hidden" name="namaBarang" value="">
	<input type="hidden" name="idBarang" value="">
	<input type="hidden" name="jumlahBarang" value="">
	<input type="hidden" name="hargaBarang" value="">
	

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

		<g:each in="${tkeluarBarangHdInstance?.keluardt}" var="h" status="i">
			<tr>
				<td>${i+1}</td>
				<td>
					<input type="text" readonly name="namaBarang" value="${h?.barang.nama}">
					<input type="hidden" name="idBarang" value="${h?.barang.id}">
				</td>
				<td><input type="text" readonly name="jumlahBarang" value="${fieldValue(bean: h, field: "jumlahBarang")}"></td>
				<td><input type="text" readonly name="hargaBarang" value="${fieldValue(bean: h, field: "hargaBarang")}"></td>
				<td>${h?.jumlahBarang * h?.hargaBarang}</td>
				<td><input type='button' onclick="hapusBarang(${i+1})" value='-'></td>
			</tr>
		</g:each>

		<tr>
			<td></td>
			<td>
				<input type="text" name="namaBarangInput" id="namaBarangInput">
				<input type="hidden" name="idBarangInput" id="idBarangInput">
			</td>
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
			select: function(event, ui) {
				document.getElementById("hargaBarangInput").value = ui.item.hargaJual;
				document.getElementById("idBarangInput").value = ui.item.id;
				document.getElementById("jumlahBarangInput").select();
			},
		});
		
		$("#namaBarangInput").bind( "keydown", function( event ) {
			if (event.keyCode != $.ui.keyCode.ENTER) {
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
			cellNamaBarang.innerHTML = "<input type='text' readonly name='namaBarang' value='" + document.getElementById("namaBarangInput").value + "'>" + "<input type='hidden' name='idBarang' value='" + document.getElementById("idBarangInput").value + "'>";
			cellJumlahBarang.innerHTML = "<input type='text' readonly name='jumlahBarang' value='" + document.getElementById("jumlahBarangInput").value + "'>";
			cellHargaBarang.innerHTML = "<input type='text' readonly name='hargaBarang' value='" + document.getElementById("hargaBarangInput").value + "'>";
			cellAction.innerHTML = "<input type='button' onclick='hapusBarang(" + barisTerakhir + ")' value='-'>";
			
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
			tblDetail.rows[i].cells[5].innerHTML = "<input type='button' onclick='hapusBarang(" + i + ")' value='-'>";;
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
