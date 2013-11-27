package com.jpos

class TkeluarBarangHd {
	Mlogin pembuat
	Date tanggalKeluar
	Mcustomer customer

	static hasMany = [keluardt:TkeluarBarangDt]

    static constraints = {
    	pembuat(nullable:true)
    	tanggalKeluar(nullable:true)
    	customer(nullable:true)
    }

    static mapping = {
    	keluardt(cascade: "all-delete-orphan")
    }
}
