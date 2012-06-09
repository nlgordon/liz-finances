package liz.finances



import org.junit.*
import grails.test.mixin.*

@TestFor(AccountEntryController)
@Mock(AccountEntry)
class AccountEntryControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/accountEntry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.accountEntryInstanceList.size() == 0
        assert model.accountEntryInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.accountEntryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.accountEntryInstance != null
        assert view == '/accountEntry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/accountEntry/show/1'
        assert controller.flash.message != null
        assert AccountEntry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/accountEntry/list'


        populateValidParams(params)
        def accountEntry = new AccountEntry(params)

        assert accountEntry.save() != null

        params.id = accountEntry.id

        def model = controller.show()

        assert model.accountEntryInstance == accountEntry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/accountEntry/list'


        populateValidParams(params)
        def accountEntry = new AccountEntry(params)

        assert accountEntry.save() != null

        params.id = accountEntry.id

        def model = controller.edit()

        assert model.accountEntryInstance == accountEntry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/accountEntry/list'

        response.reset()


        populateValidParams(params)
        def accountEntry = new AccountEntry(params)

        assert accountEntry.save() != null

        // test invalid parameters in update
        params.id = accountEntry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/accountEntry/edit"
        assert model.accountEntryInstance != null

        accountEntry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/accountEntry/show/$accountEntry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        accountEntry.clearErrors()

        populateValidParams(params)
        params.id = accountEntry.id
        params.version = -1
        controller.update()

        assert view == "/accountEntry/edit"
        assert model.accountEntryInstance != null
        assert model.accountEntryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/accountEntry/list'

        response.reset()

        populateValidParams(params)
        def accountEntry = new AccountEntry(params)

        assert accountEntry.save() != null
        assert AccountEntry.count() == 1

        params.id = accountEntry.id

        controller.delete()

        assert AccountEntry.count() == 0
        assert AccountEntry.get(accountEntry.id) == null
        assert response.redirectedUrl == '/accountEntry/list'
    }
}
