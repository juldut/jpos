package com.jpos

class TterimaBarangHd {

	Mlogin pembuat
	Date tanggalTerima
	Msupplier supplier

	static hasMany = [lpbdt:TterimaBarangDt]

    static constraints = {
    	pembuat(nullable:true)
    	tanggalTerima(nullable:true)
    	supplier(nullable:true)
    }
}
