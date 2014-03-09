package de.kantan


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * SettlementController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class SettlementController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Settlement.list(params), model:[settlementInstanceCount: Settlement.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Settlement.list(params), model:[settlementInstanceCount: Settlement.count()]
    }

    def show(Settlement settlementInstance) {
        respond settlementInstance
    }

    def create() {
        respond new Settlement(params)
    }

    @Transactional
    def save(Settlement settlementInstance) {
        if (settlementInstance == null) {
            notFound()
            return
        }

        if (settlementInstance.hasErrors()) {
            respond settlementInstance.errors, view:'create'
            return
        }

        settlementInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'settlementInstance.label', default: 'Settlement'), settlementInstance.id])
                redirect settlementInstance
            }
            '*' { respond settlementInstance, [status: CREATED] }
        }
    }

    def edit(Settlement settlementInstance) {
        respond settlementInstance
    }

    @Transactional
    def update(Settlement settlementInstance) {
        if (settlementInstance == null) {
            notFound()
            return
        }

        if (settlementInstance.hasErrors()) {
            respond settlementInstance.errors, view:'edit'
            return
        }

        settlementInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Settlement.label', default: 'Settlement'), settlementInstance.id])
                redirect settlementInstance
            }
            '*'{ respond settlementInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Settlement settlementInstance) {

        if (settlementInstance == null) {
            notFound()
            return
        }

        settlementInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Settlement.label', default: 'Settlement'), settlementInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'settlementInstance.label', default: 'Settlement'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
