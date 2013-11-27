package com.jpos

class TkeluarBarangDt {

	Mbarang barang
	Double jumlahBarang, hargaBarang

	static belongsTo = [keluarhd:TkeluarBarangDt]

    static constraints = {
    	barang(nullable:true)
    	jumlahBarang(nullable:true)
    	hargaBarang(nullable:true)
    }
}
