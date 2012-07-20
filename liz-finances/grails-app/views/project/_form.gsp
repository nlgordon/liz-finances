<%@ page import="liz.finances.Project" %>



<%--<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'accountEntry', 'error')} ">--%>
<%--	<label for="accountEntry">--%>
<%--		<g:message code="project.accountEntry.label" default="Account Entry" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${projectInstance?.accountEntry?}" var="a">--%>
<%--    <li><g:link controller="accountEntry" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="accountEntry" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'accountEntry.label', default: 'AccountEntry')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'contractNumber', 'error')} ">
	<label for="contractNumber">
		<g:message code="project.contractNumber.label" default="Contract Number" />
		
	</label>
	<g:textField name="contractNumber" value="${projectInstance?.contractNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'paymentAmount', 'error')}">
	<label for="paymentAmount">
		<g:message code="project.paymentAmount.label" default="Payment Amount" />
	</label>
	<g:field type="number" name="paymentAmount" value="${fieldValue(bean: projectInstance, field: 'paymentAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'invoiceNumber', 'error')} ">
	<label for="invoiceNumber">
		<g:message code="project.invoiceNumber.label" default="Invoice Number" />
		
	</label>
	<g:textField name="invoiceNumber" value="${projectInstance?.invoiceNumber}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'contractDone', 'error')} ">--%>
<%--	<label for="contractDone">--%>
<%--		<g:message code="project.contractDone.label" default="Contract Done" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:checkBox name="contractDone" value="${projectInstance?.contractDone}" />--%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="project.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${projectInstance?.start}" years="${2012}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'due', 'error')}">
	<label for="due">
		<g:message code="project.due.label" default="Due" />
	</label>
	<g:datePicker name="due" precision="day"  value="${projectInstance?.due}" noSelection="${['':'--']}" default="none"  years="${2012}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'completed', 'error')}">
	<label for="completed">
		<g:message code="project.completed.label" default="Completed" />
	</label>
	<g:datePicker name="completed" precision="day"  value="${projectInstance?.completed}" noSelection="${['':'--']}" default="none" years="${2012}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'paid', 'error')}">
	<label for="paid">
		<g:message code="project.paid.label" default="Paid" />
	</label>
	<g:datePicker name="paid" precision="day"  value="${projectInstance?.paid}" noSelection="${['':'--']}" default="none" years="${2012}" />
</div>

<%--<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'timeEntry', 'error')} ">--%>
<%--	<label for="timeEntry">--%>
<%--		<g:message code="project.timeEntry.label" default="Time Entry" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${projectInstance?.timeEntry?}" var="t">--%>
<%--    <li><g:link controller="timeEntry" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="timeEntry" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'timeEntry.label', default: 'TimeEntry')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%--</div>--%>

