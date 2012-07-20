package liz.finances

import javax.persistence.Column;

class TimeEntry {

    static constraints = {
		notes(nullable: true, blank: true)
    }
	
	static mapping = {
		when column: 'when_entered'
	}
	
	Project project;
	
	Date when;
	BigDecimal hours;
	String notes;
}
