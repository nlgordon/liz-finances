
<%@ page import="liz.finances.AccountEntry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountEntry.label', default: 'AccountEntry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-accountEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-accountEntry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th>Description</th>
						<th>Amount</th>
						<th>Entered</th>
<%--						<g:sortableColumn property="description" title="${message(code: 'accountEntry.description.label', default: 'Description')}" />--%>
<%--						--%>
<%--						<g:sortableColumn property="amount" title="${message(code: 'accountEntry.amount.label', default: 'Amount')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="entered" title="${message(code: 'accountEntry.entered.label', default: 'Entered')}" />--%>
					
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${accountEntryInstanceList}" status="i" var="accountEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
<%--						<td><g:link action="show" id="${accountEntryInstance.id}">${fieldValue(bean: accountEntryInstance, field: "description")}</g:link></td>--%>
						<td>${fieldValue(bean: accountEntryInstance, field: "description")}</td>
						
						<td><g:formatNumber number="${accountEntryInstance.amount}" type="currency"/></td>
					
						<td><g:formatDate date="${accountEntryInstance.entered}" type="date"/></td>
					
						<td>
							<g:link  action="edit" id="${accountEntryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accountEntryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
