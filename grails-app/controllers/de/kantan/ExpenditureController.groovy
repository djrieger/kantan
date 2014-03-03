package de.kantan



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExpenditureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expenditure.list(params), model:[expenditureInstanceCount: Expenditure.count()]
    }

    def show(Expenditure expenditureInstance) {
        respond expenditureInstance
    }

    def create() {
        respond new Expenditure(params)
    }

    @Transactional
    def save(Expenditure expenditureInstance) {
        if (expenditureInstance == null) {
            notFound()
            return
        }

        if (expenditureInstance.hasErrors()) {
            respond expenditureInstance.errors, view:'create'
            return
        }

        expenditureInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expenditureInstance.label', default: 'Expenditure'), expenditureInstance.id])
                redirect expenditureInstance
            }
            '*' { respond expenditureInstance, [status: CREATED] }
        }
    }

    def edit(Expenditure expenditureInstance) {
        respond expenditureInstance
    }

    @Transactional
    def update(Expenditure expenditureInstance) {
        if (expenditureInstance == null) {
            notFound()
            return
        }

        if (expenditureInstance.hasErrors()) {
            respond expenditureInstance.errors, view:'edit'
            return
        }

        expenditureInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Expenditure.label', default: 'Expenditure'), expenditureInstance.id])
                redirect expenditureInstance
            }
            '*'{ respond expenditureInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Expenditure expenditureInstance) {

        if (expenditureInstance == null) {
            notFound()
            return
        }

        expenditureInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Expenditure.label', default: 'Expenditure'), expenditureInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expenditureInstance.label', default: 'Expenditure'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
