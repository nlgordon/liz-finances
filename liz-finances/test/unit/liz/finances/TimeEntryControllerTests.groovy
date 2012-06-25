package liz.finances



import org.junit.*
import grails.test.mixin.*

@TestFor(TimeEntryController)
@Mock(TimeEntry)
class TimeEntryControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/timeEntry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.timeEntryInstanceList.size() == 0
        assert model.timeEntryInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.timeEntryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.timeEntryInstance != null
        assert view == '/timeEntry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/timeEntry/show/1'
        assert controller.flash.message != null
        assert TimeEntry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/timeEntry/list'


        populateValidParams(params)
        def timeEntry = new TimeEntry(params)

        assert timeEntry.save() != null

        params.id = timeEntry.id

        def model = controller.show()

        assert model.timeEntryInstance == timeEntry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/timeEntry/list'


        populateValidParams(params)
        def timeEntry = new TimeEntry(params)

        assert timeEntry.save() != null

        params.id = timeEntry.id

        def model = controller.edit()

        assert model.timeEntryInstance == timeEntry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/timeEntry/list'

        response.reset()


        populateValidParams(params)
        def timeEntry = new TimeEntry(params)

        assert timeEntry.save() != null

        // test invalid parameters in update
        params.id = timeEntry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/timeEntry/edit"
        assert model.timeEntryInstance != null

        timeEntry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/timeEntry/show/$timeEntry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        timeEntry.clearErrors()

        populateValidParams(params)
        params.id = timeEntry.id
        params.version = -1
        controller.update()

        assert view == "/timeEntry/edit"
        assert model.timeEntryInstance != null
        assert model.timeEntryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/timeEntry/list'

        response.reset()

        populateValidParams(params)
        def timeEntry = new TimeEntry(params)

        assert timeEntry.save() != null
        assert TimeEntry.count() == 1

        params.id = timeEntry.id

        controller.delete()

        assert TimeEntry.count() == 0
        assert TimeEntry.get(timeEntry.id) == null
        assert response.redirectedUrl == '/timeEntry/list'
    }
}
