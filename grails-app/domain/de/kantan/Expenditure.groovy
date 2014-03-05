package de.kantan

import org.grails.databinding.BindUsing

class Expenditure {
	Date dateCreated
	
	User creditor
	List<DebitorAndShare> debitors
	Date date
	String title
	BigDecimal amount
	@BindUsing({ obj, source -> Currency.getInstance(source['currency']) })
	Currency currency

	static belongsTo = [ settlement: Settlement ] 

	static hasMany = [ debitors: DebitorAndShare ]

//	static mapping = { debitors cascade:"all-delete-orphan" }

	static constraints = {
		// TODO: change
		date(nullable: true)
		debitors()
		
		settlement(nullable: true)
		creditor()
		title(blank: false)
		amount(notEqual: 0 as BigDecimal)
		currency()
//		validator: { String currencyCode -> 
//			Currency.getAvailableCurrencies().count { it.getCurrencyCode() == currencyCode } == 1
//		 })
	}
	
	public String toString() {
		return title
	}
}
