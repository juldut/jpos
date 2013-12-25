package com.jpos

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
// import grails.plugins.springsecurity.Secured    // for ver 1.2.7.3
import grails.plugin.springsecurity.annotation.Secured  // for ver 2.0-RC2

import java.text.NumberFormat
import java.lang.Number

// @Secured(value=["hasRole('ROLE_ADMIN')"], httpMethod='POST')
// @Secured(value=["hasRole('ROLE_ADMIN')"])
@Secured(value=["isAuthenticated()"])
class TkeluarBarangHdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tkeluarBarangHdInstanceList: TkeluarBarangHd.list(params), tkeluarBarangHdInstanceTotal: TkeluarBarangHd.count()]
    }

    def create() {
        [tkeluarBarangHdInstance: new TkeluarBarangHd(params)]
    }

    def save() {
        params.tanggalKeluar = new Date().parse("yyyy-MM-dd", params.tanggalKeluar)

        def tkeluarBarangHdInstance = new TkeluarBarangHd(params)

        if (params.idBarang == "") {
            flash.message = "Tidak ada detail"
            render(view: "create", model: [tkeluarBarangHdInstance: tkeluarBarangHdInstance])
            return
        }
        

        // for (int i=1; i<params.idBarang.length; i++) {
        //     def tempBarang = Mbarang.get(params.idBarang[i])
        //     def tempDt = new TkeluarBarangDt()
        //     tempDt.barang = tempBarang
        //     tempDt.jumlahBarang = Double.parseDouble(params.jumlahBarang[i])
        //     tempDt.hargaBarang = Double.parseDouble(params.hargaBarang[i])
        //     tkeluarBarangHdInstance.addToKeluardt(tempDt)
        // }

saveDetail(tkeluarBarangHdInstance)

        tkeluarBarangHdInstance.pembuat = springSecurityService.currentUser

        if (!tkeluarBarangHdInstance.save(flush: true)) {
            render(view: "create", model: [tkeluarBarangHdInstance: tkeluarBarangHdInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), tkeluarBarangHdInstance.id])
        redirect(action: "show", id: tkeluarBarangHdInstance.id)


    }

    def show(Long id) {
        def tkeluarBarangHdInstance = TkeluarBarangHd.get(id)
        if (!tkeluarBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "list")
            return
        }

        [tkeluarBarangHdInstance: tkeluarBarangHdInstance]
    }

    def edit(Long id) {
        def tkeluarBarangHdInstance = TkeluarBarangHd.get(id)
        if (!tkeluarBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "list")
            return
        }

        [tkeluarBarangHdInstance: tkeluarBarangHdInstance]
    }

    def update(Long id, Long version) {
        def tkeluarBarangHdInstance = TkeluarBarangHd.get(id)
        if (!tkeluarBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tkeluarBarangHdInstance.version > version) {
                tkeluarBarangHdInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd')] as Object[],
                          "Another user has updated this TkeluarBarangHd while you were editing")
                render(view: "edit", model: [tkeluarBarangHdInstance: tkeluarBarangHdInstance])
                return
            }
        }

        params.tanggalKeluar = new Date().parse("yyyy-MM-dd", params.tanggalKeluar)

        tkeluarBarangHdInstance.properties = params

        if (params.idBarang == "") {
            flash.message = "Tidak ada detail"
            render(view: "create", model: [tkeluarBarangHdInstance: tkeluarBarangHdInstance])
            return
        }

        tkeluarBarangHdInstance.keluardt.clear()

        // for (int i=1; i<params.idBarang.length; i++) {
        //     def tempBarang = Mbarang.get(params.idBarang[i])
        //     def tempDt = new TkeluarBarangDt()
        //     tempDt.barang = tempBarang
        //     tempDt.jumlahBarang = Double.parseDouble(params.jumlahBarang[i])
        //     tempDt.hargaBarang = Double.parseDouble(params.hargaBarang[i])
        //     tkeluarBarangHdInstance.addToKeluardt(tempDt)
        // }
saveDetail(tkeluarBarangHdInstance)

        if (!tkeluarBarangHdInstance.save(flush: true)) {
            render(view: "edit", model: [tkeluarBarangHdInstance: tkeluarBarangHdInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), tkeluarBarangHdInstance.id])
        redirect(action: "show", id: tkeluarBarangHdInstance.id)
    }

    def delete(Long id) {
        def tkeluarBarangHdInstance = TkeluarBarangHd.get(id)
        if (!tkeluarBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "list")
            return
        }

        try {
            tkeluarBarangHdInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tkeluarBarangHd.label', default: 'TkeluarBarangHd'), id])
            redirect(action: "show", id: id)
        }
    }

    def saveDetail(TkeluarBarangHd paramHd) {
        NumberFormat nf = NumberFormat.getInstance(Locale.US);
        Number tempNumber ; 

        for (int i=1; i<params.idBarang.length; i++) {
            def tempBarang = Mbarang.get(params.idBarang[i])
            def tempDt = new TkeluarBarangDt()
            tempDt.barang = tempBarang
            tempDt.jumlahBarang = Double.parseDouble(params.jumlahBarang[i])

            tempNumber = nf.parse(params.hargaBarang[i])
            tempDt.hargaBarang = tempNumber.doubleValue()

            paramHd.addToKeluardt(tempDt)
        }
        return
    }
}
