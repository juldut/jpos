package com.jpos

import grails.converters.JSON

class Mbarang {

	String nama
	Double hargaBeli, hargaJual
	String barcode

	Double stok

    static constraints = {
    }

    static transients = ["stok"]

    Double getStok() {
        def queryTerima = 
            """
                select sum(jumlahBarang)
                from ${TterimaBarangDt.name} 
                where barang = :paramBarang
            """
        def barangMasuk = Mbarang.executeQuery(queryTerima, [paramBarang: this])

        def queryKeluar = 
            """
                select sum(jumlahBarang)
                from ${TkeluarBarangDt.name} 
                where barang = :paramBarang
            """
        def barangKeluar = Mbarang.executeQuery(queryKeluar, [paramBarang: this])

        Double tempTotal = (barangMasuk[0] ?: 0)  - (barangKeluar[0] == null ? 0 : barangKeluar[0]) // conto 'elvis operator' (barang masuk) dan java ternary operator

        return(tempTotal)

    }

    String toString() {
        return(nama)
    }
}
