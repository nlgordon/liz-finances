
<%@ page import="liz.finances.AccountEntry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountEntry.label', default: 'AccountEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-accountEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-accountEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list accountEntry">
			
				<g:if test="${accountEntryInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="accountEntry.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:formatNumber type="currency" number="${accountEntryInstance?.amount}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountEntryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="accountEntry.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${accountEntryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountEntryInstance?.entered}">
				<li class="fieldcontain">
					<span id="entered-label" class="property-label"><g:message code="accountEntry.entered.label" default="Entered" /></span>
					
						<span class="property-value" aria-labelledby="entered-label"><g:formatDate type="date" date="${accountEntryInstance?.entered}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accountEntryInstance?.id}" />
					<g:link class="edit" action="edit" id="${accountEntryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
