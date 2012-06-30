package liz.finances

class TimeEntry {

    static constraints = {
		notes(nullable: true, blank: true)
    }
	
	Project project;
	Date when;
	BigDecimal hours;
	String notes;
}
