package liz.finances

import org.springframework.dao.DataIntegrityViolationException

class AccountEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "entered";
		params.order = "desc";
        [accountEntryInstanceList: AccountEntry.list(params), accountEntryInstanceTotal: AccountEntry.count()]
    }

    def create() {
        [accountEntryInstance: new AccountEntry(params)]
    }

    def save() {
        def accountEntryInstance = new AccountEntry(params)
        if (!accountEntryInstance.save(flush: true)) {
            render(view: "create", model: [accountEntryInstance: accountEntryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), accountEntryInstance.id])
        redirect(action: "show", id: accountEntryInstance.id)
    }

    def show() {
        def accountEntryInstance = AccountEntry.get(params.id)
        if (!accountEntryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "list")
            return
        }

        [accountEntryInstance: accountEntryInstance]
    }

    def edit() {
        def accountEntryInstance = AccountEntry.get(params.id)
        if (!accountEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "list")
            return
        }

        [accountEntryInstance: accountEntryInstance]
    }

    def update() {
        def accountEntryInstance = AccountEntry.get(params.id)
        if (!accountEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (accountEntryInstance.version > version) {
                accountEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'accountEntry.label', default: 'AccountEntry')] as Object[],
                          "Another user has updated this AccountEntry while you were editing")
                render(view: "edit", model: [accountEntryInstance: accountEntryInstance])
                return
            }
        }

        accountEntryInstance.properties = params

        if (!accountEntryInstance.save(flush: true)) {
            render(view: "edit", model: [accountEntryInstance: accountEntryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), accountEntryInstance.id])
        redirect(action: "show", id: accountEntryInstance.id)
    }

    def delete() {
        def accountEntryInstance = AccountEntry.get(params.id)
        if (!accountEntryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "list")
            return
        }

        try {
            accountEntryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'accountEntry.label', default: 'AccountEntry'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
