package com.jpos

class Msupplier {

	String nama
	String alamat

	static mappig = {
		alamat(type:'text')
	}

    static constraints = {
    }

    String toString() {
    	return(nama)
    }
}
