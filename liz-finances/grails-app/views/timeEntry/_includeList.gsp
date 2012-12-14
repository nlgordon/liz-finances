<%@ page import="liz.finances.TimeEntry" %>

<table>
	<thead>
		<tr>
			<th><g:message code="timeEntry.when.label" default="When"/></th>
		
			<th><g:message code="timeEntry.hours.label" default="Hours" /></th>
		
			<th><g:message code="timeEntry.project.label" default="Project" /></th>
		
			<th><g:message code="timeEntry.notes.label" default="Notes" />
		
		</tr>
	</thead>
	<tbody>
	<g:set var="totalHours" value="${ 0 }"/>
	<g:each in="${timeEntryList}" status="i" var="timeEntryInstance">
		<g:set var="totalHours" value="${totalHours + timeEntryInstance.hours }"/>
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>
				<g:link action="edit" controller="timeEntry" id="${timeEntryInstance.id}">
					<g:formatDate format="d MMM yyyy" date="${timeEntryInstance.when}" />
				</g:link>
			</td>
			
			<td>${fieldValue(bean: timeEntryInstance, field: "hours")}</td>
		
			<td>${fieldValue(bean: timeEntryInstance, field: "project.name")}</td>
			
			<td>${fieldValue(bean: timeEntryInstance, field: "notes")}</td>
		
		
		</tr>
	</g:each>
		<g:if test="${totalHours != 0}">
		<tr>
			<td colspan="4">Total Hours: ${totalHours }</td>
		</tr>
		</g:if>
	</tbody>
</table>