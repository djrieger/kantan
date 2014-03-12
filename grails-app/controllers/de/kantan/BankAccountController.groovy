package de.kantan


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * BankAccountController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class BankAccountController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BankAccount.list(params), model:[bankAccountInstanceCount: BankAccount.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BankAccount.list(params), model:[bankAccountInstanceCount: BankAccount.count()]
    }

    def show(BankAccount bankAccountInstance) {
        respond bankAccountInstance
    }

    def create() {
        respond new BankAccount(params)
    }

    @Transactional
    def save(BankAccount bankAccountInstance) {
        if (bankAccountInstance == null) {
            notFound()
            return
        }

        if (bankAccountInstance.hasErrors()) {
            respond bankAccountInstance.errors, view:'create'
            return
        }

        bankAccountInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bankAccountInstance.label', default: 'BankAccount'), bankAccountInstance.id])
                redirect bankAccountInstance
            }
            '*' { respond bankAccountInstance, [status: CREATED] }
        }
    }

    def edit(BankAccount bankAccountInstance) {
        respond bankAccountInstance
    }

    @Transactional
    def update(BankAccount bankAccountInstance) {
        if (bankAccountInstance == null) {
            notFound()
            return
        }

        if (bankAccountInstance.hasErrors()) {
            respond bankAccountInstance.errors, view:'edit'
            return
        }

        bankAccountInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BankAccount.label', default: 'BankAccount'), bankAccountInstance.id])
                redirect bankAccountInstance
            }
            '*'{ respond bankAccountInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BankAccount bankAccountInstance) {

        if (bankAccountInstance == null) {
            notFound()
            return
        }

        bankAccountInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BankAccount.label', default: 'BankAccount'), bankAccountInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankAccountInstance.label', default: 'BankAccount'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
