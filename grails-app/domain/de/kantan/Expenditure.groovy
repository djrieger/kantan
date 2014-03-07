package de.kantan

import org.grails.databinding.BindUsing

class Expenditure {
	Date dateCreated
	
	User creditor
	Collection<User> debitors
	Date date
	String title
	BigDecimal amount
	@BindUsing({ obj, source -> Currency.getInstance(source['currency']) })
	Currency currency

	static belongsTo = [ settlement: Settlement, community: Community ] 

	static hasMany = [ debitors: User ]

	static mapping = {
		sort dateCreated: 'desc'
	}

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
//		return title + debitors ? debitors.unique(false).collect { " ${it.username} (${ Collections.frequency(debitors, it) })" } : '';
		return title + debitors ? debitors.groupBy { it }.collect { " ${it.key} (${it.value})" } : '';
	}
}
