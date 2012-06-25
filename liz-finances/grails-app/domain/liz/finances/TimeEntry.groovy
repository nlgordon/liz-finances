package liz.finances

class TimeEntry {

    static constraints = {
    }
	
	Project project;
	Date when;
	BigDecimal amount;
	String notes;
}
