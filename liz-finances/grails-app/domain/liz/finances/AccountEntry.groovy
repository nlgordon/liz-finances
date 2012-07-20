package liz.finances

import javax.persistence.Column;

class AccountEntry {

    static constraints = {
		description(nullable: true, blank: true)
		project(nullable: true, blank: true)
    }
	
	static mapping = {
		when column: 'when_entered'
	}
	
	Date when;
	BigDecimal amount;
	String description;
	Project project;
}
