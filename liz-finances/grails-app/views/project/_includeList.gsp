<%@ page import="liz.finances.Project" %>

<table>
	<thead>
		<tr>
			<th>Name</th>
			<th>Started</th>
			<th>Due</th>
			<th>Completed</th>
			<th>Contract Number</th>
			<th>Invoice Number</th>
		</tr>
	</thead>
	<tbody>
	<g:each in="${projectList}" status="i" var="project">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:link action="show" controller="project" id="${project.id}">${project.name}</g:link></td>
			<td><g:formatDate format="d MMM yyyy" date="${project.start}" /></td>
			<td><g:formatDate format="d MMM yyyy" date="${project.due }"/></td>
			<td><g:formatDate format="d MMM yyyy" date="${project.completed }"/></td>
			<td>${project.contractNumber }</td>
			<td>${project.invoiceNumber }</td>
			
		</tr>
	</g:each>
	</tbody>
</table>