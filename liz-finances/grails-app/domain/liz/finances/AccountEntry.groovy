package liz.finances

class AccountEntry {

    static constraints = {
		description(nullable: true, blank: true)
		project(nullable: true, blank: true)
    }
	
	Date when;
	BigDecimal amount;
	String description;
	Project project;
}
