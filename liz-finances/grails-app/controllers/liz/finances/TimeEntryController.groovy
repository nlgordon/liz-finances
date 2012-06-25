package liz.finances

import org.springframework.dao.DataIntegrityViolationException

class TimeEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [timeEntryInstanceList: TimeEntry.list(params), timeEntryInstanceTotal: TimeEntry.count()]
    }

    def create() {
        [timeEntryInstance: new TimeEntry(params)]
    }

    def save() {
        def timeEntryInstance = new TimeEntry(params)
        if (!timeEntryInstance.save(flush: true)) {
            render(view: "create", model: [timeEntryInstance: timeEntryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), timeEntryInstance.id])
        redirect(action: "show", id: timeEntryInstance.id)
    }

    def show() {
        def timeEntryInstance = TimeEntry.get(params.id)
        if (!timeEntryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "list")
            return
        }

        [timeEntryInstance: timeEntryInstance]
    }

    def edit() {
        def timeEntryInstance = TimeEntry.get(params.id)
        if (!timeEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "list")
            return
        }

        [timeEntryInstance: timeEntryInstance]
    }

    def update() {
        def timeEntryInstance = TimeEntry.get(params.id)
        if (!timeEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (timeEntryInstance.version > version) {
                timeEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'timeEntry.label', default: 'TimeEntry')] as Object[],
                          "Another user has updated this TimeEntry while you were editing")
                render(view: "edit", model: [timeEntryInstance: timeEntryInstance])
                return
            }
        }

        timeEntryInstance.properties = params

        if (!timeEntryInstance.save(flush: true)) {
            render(view: "edit", model: [timeEntryInstance: timeEntryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), timeEntryInstance.id])
        redirect(action: "show", id: timeEntryInstance.id)
    }

    def delete() {
        def timeEntryInstance = TimeEntry.get(params.id)
        if (!timeEntryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "list")
            return
        }

        try {
            timeEntryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'timeEntry.label', default: 'TimeEntry'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
