<%@ page import="liz.finances.AccountEntry" %>

<table>
	<thead>
		<tr>
			<th><g:message code="accountEntry.when.label" default="When"/></th>
		
			<th><g:message code="accountEntry.amount.label" default="Amount" /></th>
		
			<th><g:message code="accountEntry.project.label" default="Project" /></th>
		
			<th><g:message code="accountEntry.description.label" default="Description" />
		
		</tr>
	</thead>
	<tbody>
	<g:each in="${accountEntryList}" status="i" var="accountEntryInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>
				<g:link action="edit" controller="accountEntry" id="${accountEntryInstance.id}">
					<g:formatDate format="d MMM yyyy" date="${accountEntryInstance.when}" />
				</g:link>
			</td>
			
			<td>
				<g:formatNumber number="${accountEntryInstance?.amount}" type="currency" currencyCode="USD"/>
			</td>
		
							
			<td>${fieldValue(bean: accountEntryInstance, field: "project.name")}</td>
			
			<td>${fieldValue(bean: accountEntryInstance, field: "description")}</td>
		
		
		</tr>
	</g:each>
	</tbody>
</table>