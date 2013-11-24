package com.jpos

import org.springframework.dao.DataIntegrityViolationException

class TterimaBarangHdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tterimaBarangHdInstanceList: TterimaBarangHd.list(params), tterimaBarangHdInstanceTotal: TterimaBarangHd.count()]
    }

    def create() {
        [tterimaBarangHdInstance: new TterimaBarangHd(params)]
    }

    def save() {
        def tterimaBarangHdInstance = new TterimaBarangHd(params)

        
        // def tterimaBarangHdInstance = new TterimaBarangHd(params)
        // if (!tterimaBarangHdInstance.save(flush: true)) {
        //     render(view: "create", model: [tterimaBarangHdInstance: tterimaBarangHdInstance])
        //     return
        // }

        // flash.message = message(code: 'default.created.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), tterimaBarangHdInstance.id])
        // redirect(action: "show", id: tterimaBarangHdInstance.id)
    }

    def show(Long id) {
        def tterimaBarangHdInstance = TterimaBarangHd.get(id)
        if (!tterimaBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "list")
            return
        }

        [tterimaBarangHdInstance: tterimaBarangHdInstance]
    }

    def edit(Long id) {
        def tterimaBarangHdInstance = TterimaBarangHd.get(id)
        if (!tterimaBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "list")
            return
        }

        [tterimaBarangHdInstance: tterimaBarangHdInstance]
    }

    def update(Long id, Long version) {
        def tterimaBarangHdInstance = TterimaBarangHd.get(id)
        if (!tterimaBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tterimaBarangHdInstance.version > version) {
                tterimaBarangHdInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd')] as Object[],
                          "Another user has updated this TterimaBarangHd while you were editing")
                render(view: "edit", model: [tterimaBarangHdInstance: tterimaBarangHdInstance])
                return
            }
        }

        tterimaBarangHdInstance.properties = params

        if (!tterimaBarangHdInstance.save(flush: true)) {
            render(view: "edit", model: [tterimaBarangHdInstance: tterimaBarangHdInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), tterimaBarangHdInstance.id])
        redirect(action: "show", id: tterimaBarangHdInstance.id)
    }

    def delete(Long id) {
        def tterimaBarangHdInstance = TterimaBarangHd.get(id)
        if (!tterimaBarangHdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "list")
            return
        }

        try {
            tterimaBarangHdInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tterimaBarangHd.label', default: 'TterimaBarangHd'), id])
            redirect(action: "show", id: id)
        }
    }
}
