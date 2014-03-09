package de.kantan


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.grails.databinding.BindUsing

class ExpenditureCommandObject {
	User creditor
	Map guestCount
	Date date
	String title
	BigDecimal amount
	String currency
	Community community
}

/**
 * ExpenditureController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ExpenditureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expenditure.list(params), model:[expenditureInstanceCount: Expenditure.count()]
    }

	def list(Integer max) {
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
    def save(ExpenditureCommandObject cmd) {
    	Expenditure expenditureInstance = new Expenditure(
			creditor: cmd.creditor,
			date: cmd.date,
			title: cmd.title,
			amount: cmd.amount,
			currency: cmd.currency,
			community: cmd.community
		)
		cmd.guestCount.each {
			User debitor = User.get(it.key.toInteger())
			(it.value.toInteger() + 1).times { expenditureInstance.addToDebitors(debitor) }
		}

        if (expenditureInstance.hasErrors()) {
            respond expenditureInstance.errors, view:'create'
            return
        }
		
        expenditureInstance.save flush:true

        request.withFormat {
            form {
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
            form {
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
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Expenditure.label', default: 'Expenditure'), expenditureInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	def balances() {
		/*
		 * if (cook.toLowerCase() == currentGuest.toLowerCase()) {
      newValues[0][sourcecol - 6] = amount - paysFor * perGuest;
      //calculationSheet.getRange(row, destcol).setValue(amount - paysFor * perGuest);
    } else {
      newValues[0][sourcecol - 6] = - paysFor * perGuest;
		 */
		Community c = Community.get(1)
		List<Expenditure> expenditures = Expenditure.findAllByCommunityAndSettlement(c, null)
		Map<User, BigDecimal> balances = [:].withDefault { 0 as BigDecimal }
		c.users.each { User user ->
			List<Expenditure> e = expenditures.findAll { it.creditor == user || it.debitors.contains(user) }
			e.each {	
				if (user == it.creditor) {
					balances[user] += it.amount
				} 
				Integer paysFor = it.debitors.count { it == user }
				balances[user] -= paysFor * (it.amount / it.debitors.size())
			}		
		}
		[balances: balances]
	}
	
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expenditureInstance.label', default: 'Expenditure'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
