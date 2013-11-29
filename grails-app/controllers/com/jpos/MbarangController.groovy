package com.jpos

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class MbarangController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def dataSource

    def autocomplete() {
        def query = """
                     select new map(
                        id as id, 
                        nama as value, 
                        concat(barcode, ' - ', nama) as label, 
                        hargaBeli as hargaBeli,
                        hargaJual as hargaJual
                     )
                     from ${Mbarang.name} 
                     where 
                        nama like concat('%', :paramNamaBarang, '%')
                        or barcode like concat('%', :paramNamaBarang, '%')
                    """

        def arrNamaBarang = Mbarang.executeQuery(query, [paramNamaBarang: params.term?.toString()])

        render arrNamaBarang as JSON        
    }

    def cekstok() {

        groovy.sql.Sql tempSql = new groovy.sql.Sql(dataSource)

        def arrNamaBarang = tempSql.rows("""
            SELECT mbarang.*, 
                (
                    COALESCE(stok_awal, 0)
                    + COALESCE(terima.jumlah_terima, 0)
                    - COALESCE(keluar.jumlah_keluar, 0)
                ) AS stok
            FROM 
                mbarang 
                LEFT JOIN
                (
                    SELECT barang_id, sum(jumlah_barang) AS jumlah_terima
                    FROM tterima_barang_dt 
                    GROUP BY barang_id
                ) terima ON mbarang.id = terima.barang_id
                LEFT JOIN
                (
                    SELECT barang_id, sum(jumlah_barang) AS jumlah_keluar
                    FROM tkeluar_barang_dt 
                    GROUP BY barang_id
                ) keluar ON mbarang.id = keluar.barang_id
        """)

        tempSql.close()


        [mbarangInstanceList:arrNamaBarang]

    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mbarangInstanceList: Mbarang.list(params), mbarangInstanceTotal: Mbarang.count()]
    }

    def create() {
        [mbarangInstance: new Mbarang(params)]
    }

    def save() {
        def mbarangInstance = new Mbarang(params)
        if (!mbarangInstance.save(flush: true)) {
            render(view: "create", model: [mbarangInstance: mbarangInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), mbarangInstance.id])
        redirect(action: "show", id: mbarangInstance.id)
    }

    def show(Long id) {
        def mbarangInstance = Mbarang.get(id)
        if (!mbarangInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "list")
            return
        }

        [mbarangInstance: mbarangInstance]
    }

    def edit(Long id) {
        def mbarangInstance = Mbarang.get(id)
        if (!mbarangInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "list")
            return
        }

        [mbarangInstance: mbarangInstance]
    }

    def update(Long id, Long version) {
        def mbarangInstance = Mbarang.get(id)
        if (!mbarangInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mbarangInstance.version > version) {
                mbarangInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mbarang.label', default: 'Mbarang')] as Object[],
                          "Another user has updated this Mbarang while you were editing")
                render(view: "edit", model: [mbarangInstance: mbarangInstance])
                return
            }
        }

        mbarangInstance.properties = params

        if (!mbarangInstance.save(flush: true)) {
            render(view: "edit", model: [mbarangInstance: mbarangInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), mbarangInstance.id])
        redirect(action: "show", id: mbarangInstance.id)
    }

    def delete(Long id) {
        def mbarangInstance = Mbarang.get(id)
        if (!mbarangInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "list")
            return
        }

        try {
            mbarangInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mbarang.label', default: 'Mbarang'), id])
            redirect(action: "show", id: id)
        }
    }
}
