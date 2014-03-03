package de.kantan

class Expenditure {
	User creditor
	List<DebitorAndShare> debitors
	Date date
	String title
	BigDecimal amount
	Currency currency
	
	boolean billed = false
	
    static constraints = {
		creditor()
		debitors()
		title(blank: false)
		amount(notEqual: 0 as BigDecimal)
		currency()
    }
}
