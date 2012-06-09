<%@ page import="liz.finances.AccountEntry" %>



<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="accountEntry.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" required="" value="${accountEntryInstance?.amount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="accountEntry.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="text" name="description" value="${accountEntryInstance?.description}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountEntryInstance, field: 'entered', 'error')} required">
	<label for="entered">
		<g:message code="accountEntry.entered.label" default="Entered" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entered" precision="day"  value="${accountEntryInstance?.entered}" required="" />
</div>

