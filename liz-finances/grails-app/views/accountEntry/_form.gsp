<%@ page import="liz.finances.AccountEntry" %>



<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="accountEntry.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" required="" value="${accountEntryInstance?.amount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'when', 'error')} required">
	<label for="when">
		<g:message code="accountEntry.when.label" default="When" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="when" precision="day"  value="${accountEntryInstance?.when}" required="" relativeYears="${-1..1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="accountEntry.description.label" default="Description" />
	</label>
	<g:field type="text" name="description" value="${accountEntryInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'paymentNumber', 'error')} ">
	<label for="paymentNumber">
		<g:message code="accountEntry.paymentNumber.label" default="Payment Number" />
	</label>
	<g:field type="text" name="paymentNumber" value="${accountEntryInstance?.paymentNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'project', 'error')}">
	<label for="project">
		<g:message code="accountEntry.project.label" default="Project" />
	</label>
	<g:select id="project" name="project.id" noSelection="[null: '--']" from="${liz.finances.Project.list()}" optionKey="id" optionValue="name" required="" value="${accountEntryInstance?.project?.id}" class="many-to-one"/>
</div>
