package com.jpos



import org.junit.*
import grails.test.mixin.*

@TestFor(TterimaBarangHdController)
@Mock(TterimaBarangHd)
class TterimaBarangHdControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tterimaBarangHd/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tterimaBarangHdInstanceList.size() == 0
        assert model.tterimaBarangHdInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tterimaBarangHdInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tterimaBarangHdInstance != null
        assert view == '/tterimaBarangHd/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tterimaBarangHd/show/1'
        assert controller.flash.message != null
        assert TterimaBarangHd.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tterimaBarangHd/list'

        populateValidParams(params)
        def tterimaBarangHd = new TterimaBarangHd(params)

        assert tterimaBarangHd.save() != null

        params.id = tterimaBarangHd.id

        def model = controller.show()

        assert model.tterimaBarangHdInstance == tterimaBarangHd
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tterimaBarangHd/list'

        populateValidParams(params)
        def tterimaBarangHd = new TterimaBarangHd(params)

        assert tterimaBarangHd.save() != null

        params.id = tterimaBarangHd.id

        def model = controller.edit()

        assert model.tterimaBarangHdInstance == tterimaBarangHd
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tterimaBarangHd/list'

        response.reset()

        populateValidParams(params)
        def tterimaBarangHd = new TterimaBarangHd(params)

        assert tterimaBarangHd.save() != null

        // test invalid parameters in update
        params.id = tterimaBarangHd.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tterimaBarangHd/edit"
        assert model.tterimaBarangHdInstance != null

        tterimaBarangHd.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tterimaBarangHd/show/$tterimaBarangHd.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tterimaBarangHd.clearErrors()

        populateValidParams(params)
        params.id = tterimaBarangHd.id
        params.version = -1
        controller.update()

        assert view == "/tterimaBarangHd/edit"
        assert model.tterimaBarangHdInstance != null
        assert model.tterimaBarangHdInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tterimaBarangHd/list'

        response.reset()

        populateValidParams(params)
        def tterimaBarangHd = new TterimaBarangHd(params)

        assert tterimaBarangHd.save() != null
        assert TterimaBarangHd.count() == 1

        params.id = tterimaBarangHd.id

        controller.delete()

        assert TterimaBarangHd.count() == 0
        assert TterimaBarangHd.get(tterimaBarangHd.id) == null
        assert response.redirectedUrl == '/tterimaBarangHd/list'
    }
}
