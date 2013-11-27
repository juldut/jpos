package com.jpos



import org.junit.*
import grails.test.mixin.*

@TestFor(TkeluarBarangHdController)
@Mock(TkeluarBarangHd)
class TkeluarBarangHdControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tkeluarBarangHd/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tkeluarBarangHdInstanceList.size() == 0
        assert model.tkeluarBarangHdInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tkeluarBarangHdInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tkeluarBarangHdInstance != null
        assert view == '/tkeluarBarangHd/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tkeluarBarangHd/show/1'
        assert controller.flash.message != null
        assert TkeluarBarangHd.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tkeluarBarangHd/list'

        populateValidParams(params)
        def tkeluarBarangHd = new TkeluarBarangHd(params)

        assert tkeluarBarangHd.save() != null

        params.id = tkeluarBarangHd.id

        def model = controller.show()

        assert model.tkeluarBarangHdInstance == tkeluarBarangHd
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tkeluarBarangHd/list'

        populateValidParams(params)
        def tkeluarBarangHd = new TkeluarBarangHd(params)

        assert tkeluarBarangHd.save() != null

        params.id = tkeluarBarangHd.id

        def model = controller.edit()

        assert model.tkeluarBarangHdInstance == tkeluarBarangHd
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tkeluarBarangHd/list'

        response.reset()

        populateValidParams(params)
        def tkeluarBarangHd = new TkeluarBarangHd(params)

        assert tkeluarBarangHd.save() != null

        // test invalid parameters in update
        params.id = tkeluarBarangHd.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tkeluarBarangHd/edit"
        assert model.tkeluarBarangHdInstance != null

        tkeluarBarangHd.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tkeluarBarangHd/show/$tkeluarBarangHd.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tkeluarBarangHd.clearErrors()

        populateValidParams(params)
        params.id = tkeluarBarangHd.id
        params.version = -1
        controller.update()

        assert view == "/tkeluarBarangHd/edit"
        assert model.tkeluarBarangHdInstance != null
        assert model.tkeluarBarangHdInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tkeluarBarangHd/list'

        response.reset()

        populateValidParams(params)
        def tkeluarBarangHd = new TkeluarBarangHd(params)

        assert tkeluarBarangHd.save() != null
        assert TkeluarBarangHd.count() == 1

        params.id = tkeluarBarangHd.id

        controller.delete()

        assert TkeluarBarangHd.count() == 0
        assert TkeluarBarangHd.get(tkeluarBarangHd.id) == null
        assert response.redirectedUrl == '/tkeluarBarangHd/list'
    }
}
