package liz.finances

import org.joda.time.DateTime;

class IndexController {

    def index() { 
		params.order = "desc";
		params.sort = "when";
		Date start = new DateTime().minusDays(14).toDate();
		List timeEntries = TimeEntry.findAllByWhenGreaterThanEquals(start, params);
		List projects = Project.findAllByPaidIsNull();
		List accountEntries = AccountEntry.findAllByWhenGreaterThanEquals(start, params);
        [timeEntryList: timeEntries, projectList: projects, accountEntryList: accountEntries];
	}
}
