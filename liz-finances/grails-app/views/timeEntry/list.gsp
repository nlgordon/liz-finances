
<%@ page import="liz.finances.TimeEntry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timeEntry.label', default: 'TimeEntry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-timeEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-timeEntry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="when" title="${message(code: 'timeEntry.when.label', default: 'When')}" />
						
						<g:sortableColumn property="hours" title="${message(code: 'timeEntry.hours.label', default: 'Hours')}" />
					
						<th><g:message code="timeEntry.project.label" default="Project" /></th>
						
						<g:sortableColumn property="notes" title="${message(code: 'timeEntry.notes.label', default: 'Notes')}" />
					
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${timeEntryInstanceList}" status="i" var="timeEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:link action="show" id="${timeEntryInstance.id}">
								<g:formatDate format="d MMM yyyy" date="${timeEntryInstance.when}" />
							</g:link>
						</td>
						
						<td>${fieldValue(bean: timeEntryInstance, field: "hours")}</td>
					
						<td>${fieldValue(bean: timeEntryInstance, field: "project.name")}</td>
						
						<td>${fieldValue(bean: timeEntryInstance, field: "notes")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${timeEntryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
