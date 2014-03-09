package de.kantan

class User {

	transient springSecurityService

	String username
	String password
	String email
	Locale preferredLocale = Locale.GERMANY
	Set<Community> communities
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static belongsTo = [ communities: Community ]
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank: false, unique: true, email: true
		communities(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	public String toString() {
		return username
	}
}
