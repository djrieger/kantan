package de.kantan

class DebitorAndShare {
	User debitor
	int share = 1
	boolean deleted // = false
	
	static transients = [ 'deleted' ]
	
	static belongsTo = [ expenditure: Expenditure ]
	
    static constraints = {
		debitor(unique: ['expenditure'])
		share(min: 1)
    }
	
	public String toString() {
		return "$debitor ($share${ deleted ? ', deleted' : '' })"
	}
}
