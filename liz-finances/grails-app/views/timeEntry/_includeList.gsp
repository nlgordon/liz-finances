<%@ page import="liz.finances.TimeEntry" %>

<table>
	<thead>
		<tr>
			<th><g:message code="timeEntry.when.label" default="When"/></th>
		
			<th><g:message code="timeEntry.amount.label" default="Amount" /></th>
		
			<th><g:message code="timeEntry.project.label" default="Project" /></th>
		
			<th><g:message code="timeEntry.notes.label" default="Notes" />
		
		</tr>
	</thead>
	<tbody>
	<g:each in="${timeEntryList}" status="i" var="timeEntryInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>
				<g:link action="edit" controller="timeEntry" id="${timeEntryInstance.id}">
					<g:formatDate format="d MMM yyyy" date="${timeEntryInstance.when}" />
				</g:link>
			</td>
			
			<td>${fieldValue(bean: timeEntryInstance, field: "amount")}</td>
		
			<td>${fieldValue(bean: timeEntryInstance, field: "project.name")}</td>
			
			<td>${fieldValue(bean: timeEntryInstance, field: "notes")}</td>
		
		
		</tr>
	</g:each>
	</tbody>
</table>