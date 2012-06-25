<%@ page import="liz.finances.TimeEntry" %>



<div class="fieldcontain ${hasErrors(bean: timeEntryInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="timeEntry.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" max="24" step=".1" name="amount" required="" value="${fieldValue(bean: timeEntryInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeEntryInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="timeEntry.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${timeEntryInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeEntryInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="timeEntry.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" optionValue="name" optionKey="id" from="${liz.finances.Project.list()}" optionKey="id" required="" value="${timeEntryInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeEntryInstance, field: 'when', 'error')} required">
	<label for="when">
		<g:message code="timeEntry.when.label" default="When" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="when" precision="day"  value="${timeEntryInstance?.when}"  />
</div>

