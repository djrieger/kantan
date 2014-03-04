package de.kantan

class DebitorAndShare {
	User debitor
	int share = 1
	boolean deleted
	
	static transients = [ 'deleted' ]
	
	static belongsTo = [ expenditure: Expenditure ]
	
    static constraints = {
		debitor()
		share(min: 1)
    }
}
