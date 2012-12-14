package liz.finances

import org.joda.time.DateTime;

class IndexController {

    def index() { 
		params.order = "desc";
		params.sort = "when";
		Date start = new DateTime().minusDays(7).toDate();
		List timeEntries = TimeEntry.findAllByWhenGreaterThanEquals(start, params);
		List projects = Project.findAllByPaidIsNull([sort: "start"]);
		List accountEntries = AccountEntry.findAll([max: 15] + params);
        [timeEntryList: timeEntries, projectList: projects, accountEntryList: accountEntries];
	}
}
