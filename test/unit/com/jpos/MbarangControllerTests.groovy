package com.jpos



import org.junit.*
import grails.test.mixin.*

@TestFor(MbarangController)
@Mock(Mbarang)
class MbarangControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mbarang/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mbarangInstanceList.size() == 0
        assert model.mbarangInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mbarangInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mbarangInstance != null
        assert view == '/mbarang/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mbarang/show/1'
        assert controller.flash.message != null
        assert Mbarang.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mbarang/list'

        populateValidParams(params)
        def mbarang = new Mbarang(params)

        assert mbarang.save() != null

        params.id = mbarang.id

        def model = controller.show()

        assert model.mbarangInstance == mbarang
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mbarang/list'

        populateValidParams(params)
        def mbarang = new Mbarang(params)

        assert mbarang.save() != null

        params.id = mbarang.id

        def model = controller.edit()

        assert model.mbarangInstance == mbarang
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mbarang/list'

        response.reset()

        populateValidParams(params)
        def mbarang = new Mbarang(params)

        assert mbarang.save() != null

        // test invalid parameters in update
        params.id = mbarang.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mbarang/edit"
        assert model.mbarangInstance != null

        mbarang.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mbarang/show/$mbarang.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mbarang.clearErrors()

        populateValidParams(params)
        params.id = mbarang.id
        params.version = -1
        controller.update()

        assert view == "/mbarang/edit"
        assert model.mbarangInstance != null
        assert model.mbarangInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mbarang/list'

        response.reset()

        populateValidParams(params)
        def mbarang = new Mbarang(params)

        assert mbarang.save() != null
        assert Mbarang.count() == 1

        params.id = mbarang.id

        controller.delete()

        assert Mbarang.count() == 0
        assert Mbarang.get(mbarang.id) == null
        assert response.redirectedUrl == '/mbarang/list'
    }
}
