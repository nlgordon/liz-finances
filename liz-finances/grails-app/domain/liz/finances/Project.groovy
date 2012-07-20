package liz.finances

class Project {

    static constraints = {
		due(nullable: true, blank: true)
		completed(nullable: true, blank: true)
		paid(nullable: true, blank: true)
		paymentAmount(nullable: true, blank: true)
		invoiceNumber(nullable: true, blank: true)
		contractDone(nullable: true, blank: true)
    }
	
	static hasMany = [timeEntry: TimeEntry, accountEntry: AccountEntry];
	
	String name;
	Date start;
	Date due;
	Date completed;
	Date paid;
	String contractNumber;
	Boolean contractDone;
	BigDecimal paymentAmount;
	String invoiceNumber;
	
}
