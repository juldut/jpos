package com.jpos



import org.junit.*
import grails.test.mixin.*

@TestFor(MsupplierController)
@Mock(Msupplier)
class MsupplierControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/msupplier/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.msupplierInstanceList.size() == 0
        assert model.msupplierInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.msupplierInstance != null
    }

    void testSave() {
        controller.save()

        assert model.msupplierInstance != null
        assert view == '/msupplier/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/msupplier/show/1'
        assert controller.flash.message != null
        assert Msupplier.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/msupplier/list'

        populateValidParams(params)
        def msupplier = new Msupplier(params)

        assert msupplier.save() != null

        params.id = msupplier.id

        def model = controller.show()

        assert model.msupplierInstance == msupplier
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/msupplier/list'

        populateValidParams(params)
        def msupplier = new Msupplier(params)

        assert msupplier.save() != null

        params.id = msupplier.id

        def model = controller.edit()

        assert model.msupplierInstance == msupplier
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/msupplier/list'

        response.reset()

        populateValidParams(params)
        def msupplier = new Msupplier(params)

        assert msupplier.save() != null

        // test invalid parameters in update
        params.id = msupplier.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/msupplier/edit"
        assert model.msupplierInstance != null

        msupplier.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/msupplier/show/$msupplier.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        msupplier.clearErrors()

        populateValidParams(params)
        params.id = msupplier.id
        params.version = -1
        controller.update()

        assert view == "/msupplier/edit"
        assert model.msupplierInstance != null
        assert model.msupplierInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/msupplier/list'

        response.reset()

        populateValidParams(params)
        def msupplier = new Msupplier(params)

        assert msupplier.save() != null
        assert Msupplier.count() == 1

        params.id = msupplier.id

        controller.delete()

        assert Msupplier.count() == 0
        assert Msupplier.get(msupplier.id) == null
        assert response.redirectedUrl == '/msupplier/list'
    }
}
