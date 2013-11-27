package com.jpos



import org.junit.*
import grails.test.mixin.*

@TestFor(McustomerController)
@Mock(Mcustomer)
class McustomerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mcustomer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mcustomerInstanceList.size() == 0
        assert model.mcustomerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mcustomerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mcustomerInstance != null
        assert view == '/mcustomer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mcustomer/show/1'
        assert controller.flash.message != null
        assert Mcustomer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mcustomer/list'

        populateValidParams(params)
        def mcustomer = new Mcustomer(params)

        assert mcustomer.save() != null

        params.id = mcustomer.id

        def model = controller.show()

        assert model.mcustomerInstance == mcustomer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mcustomer/list'

        populateValidParams(params)
        def mcustomer = new Mcustomer(params)

        assert mcustomer.save() != null

        params.id = mcustomer.id

        def model = controller.edit()

        assert model.mcustomerInstance == mcustomer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mcustomer/list'

        response.reset()

        populateValidParams(params)
        def mcustomer = new Mcustomer(params)

        assert mcustomer.save() != null

        // test invalid parameters in update
        params.id = mcustomer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mcustomer/edit"
        assert model.mcustomerInstance != null

        mcustomer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mcustomer/show/$mcustomer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mcustomer.clearErrors()

        populateValidParams(params)
        params.id = mcustomer.id
        params.version = -1
        controller.update()

        assert view == "/mcustomer/edit"
        assert model.mcustomerInstance != null
        assert model.mcustomerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mcustomer/list'

        response.reset()

        populateValidParams(params)
        def mcustomer = new Mcustomer(params)

        assert mcustomer.save() != null
        assert Mcustomer.count() == 1

        params.id = mcustomer.id

        controller.delete()

        assert Mcustomer.count() == 0
        assert Mcustomer.get(mcustomer.id) == null
        assert response.redirectedUrl == '/mcustomer/list'
    }
}
