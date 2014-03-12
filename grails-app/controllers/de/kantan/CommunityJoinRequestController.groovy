package de.kantan


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * CommunityJoinRequestController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CommunityJoinRequestController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CommunityJoinRequest.list(params), model:[communityJoinRequestInstanceCount: CommunityJoinRequest.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CommunityJoinRequest.list(params), model:[communityJoinRequestInstanceCount: CommunityJoinRequest.count()]
    }

    def show(CommunityJoinRequest communityJoinRequestInstance) {
        respond communityJoinRequestInstance
    }

    def create() {
        respond new CommunityJoinRequest(params)
    }

    @Transactional
    def save(CommunityJoinRequest communityJoinRequestInstance) {
        if (communityJoinRequestInstance == null) {
            notFound()
            return
        }

        if (communityJoinRequestInstance.hasErrors()) {
            respond communityJoinRequestInstance.errors, view:'create'
            return
        }

        communityJoinRequestInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'communityJoinRequestInstance.label', default: 'CommunityJoinRequest'), communityJoinRequestInstance.id])
                redirect communityJoinRequestInstance
            }
            '*' { respond communityJoinRequestInstance, [status: CREATED] }
        }
    }

    def edit(CommunityJoinRequest communityJoinRequestInstance) {
        respond communityJoinRequestInstance
    }

    @Transactional
    def update(CommunityJoinRequest communityJoinRequestInstance) {
        if (communityJoinRequestInstance == null) {
            notFound()
            return
        }

        if (communityJoinRequestInstance.hasErrors()) {
            respond communityJoinRequestInstance.errors, view:'edit'
            return
        }

        communityJoinRequestInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CommunityJoinRequest.label', default: 'CommunityJoinRequest'), communityJoinRequestInstance.id])
                redirect communityJoinRequestInstance
            }
            '*'{ respond communityJoinRequestInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CommunityJoinRequest communityJoinRequestInstance) {

        if (communityJoinRequestInstance == null) {
            notFound()
            return
        }

        communityJoinRequestInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CommunityJoinRequest.label', default: 'CommunityJoinRequest'), communityJoinRequestInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'communityJoinRequestInstance.label', default: 'CommunityJoinRequest'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	public void deny() {
		joinRequest.delete(failOnError: true)
	}

	public void grant(CommunityJoinRequest joinRequest) {
		joinRequest.community.addToUsers(joinRequest.user).save(failOnError: true)
		joinRequest.delete(failOnError: true)
	}
}
