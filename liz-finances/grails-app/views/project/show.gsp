
<%@ page import="liz.finances.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
			
				<g:if test="${projectInstance?.contractDone}">
				<li class="fieldcontain">
					<span id="contractDone-label" class="property-label"><g:message code="project.contractDone.label" default="Contract Done" /></span>
					
						<span class="property-value" aria-labelledby="contractDone-label"><g:formatBoolean boolean="${projectInstance?.contractDone}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.contractNumber}">
				<li class="fieldcontain">
					<span id="contractNumber-label" class="property-label"><g:message code="project.contractNumber.label" default="Contract Number" /></span>
					
						<span class="property-value" aria-labelledby="contractNumber-label"><g:fieldValue bean="${projectInstance}" field="contractNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="project.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.paymentAmount}">
				<li class="fieldcontain">
					<span id="paymentAmount-label" class="property-label"><g:message code="project.paymentAmount.label" default="Payment Amount" /></span>
					
						<span class="property-value" aria-labelledby="paymentAmount-label"><g:fieldValue bean="${projectInstance}" field="paymentAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.start}">
				<li class="fieldcontain">
					<span id="start-label" class="property-label"><g:message code="project.start.label" default="Start" /></span>
					
						<span class="property-value" aria-labelledby="start-label"><g:formatDate format="d MMM yyyy" date="${projectInstance?.start}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.due}">
				<li class="fieldcontain">
					<span id="paid-label" class="property-label"><g:message code="project.due.label" default="Due" /></span>
					
						<span class="property-value" aria-labelledby="due-label"><g:formatDate format="d MMM yyyy" date="${projectInstance?.due}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.completed}">
				<li class="fieldcontain">
					<span id="completed-label" class="property-label"><g:message code="project.completed.label" default="Completed" /></span>
					
						<span class="property-value" aria-labelledby="completed-label"><g:formatDate format="d MMM yyyy" date="${projectInstance?.completed}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.paid}">
				<li class="fieldcontain">
					<span id="paid-label" class="property-label"><g:message code="project.paid.label" default="Paid" /></span>
					
						<span class="property-value" aria-labelledby="paid-label"><g:formatDate format="d MMM yyyy" date="${projectInstance?.paid}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
			<h2>Time Entries</h2>
			<g:render template="/timeEntry/includeList" model="${[timeEntryList: projectInstance.timeEntry] }"/>
				
				<g:if test="${projectInstance?.accountEntry}">
				<li class="fieldcontain">
					<span id="accountEntry-label" class="property-label"><g:message code="project.accountEntry.label" default="Account Entry" /></span>
					
						<g:each in="${projectInstance.accountEntry}" var="a">
						<span class="property-value" aria-labelledby="accountEntry-label"><g:link controller="accountEntry" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
		</div>
	</body>
</html>
