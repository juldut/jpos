package com.jpos

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class MbarangController {

	def autocomplete() {
		def query = """
		             select new map(id as id, 
		                            nama as value, 
		                            concat(nama, ' - ') as label) 
		             from ${Mbarang.name} 
		             where nama like concat('%', :paramNamaBarang, '%')
		            """

		def arrNamaBarang = Mbarang.executeQuery(query, [paramNamaBarang: params.term?.toString()])

		render arrNamaBarang as JSON		
	}

    static scaffold = true
}
