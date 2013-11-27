package com.jpos

class TterimaBarangDt {

	Mbarang barang
	Double jumlahBarang, hargaBarang

	static belongsTo = [lpbhd:TterimaBarangHd]

    static constraints = {
    	lpbhd(nullable:true)

    }
}
