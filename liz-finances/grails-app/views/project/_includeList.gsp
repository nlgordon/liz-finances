<%@ page import="liz.finances.Project" %>

<table>
	<thead>
		<tr>
			<th>Name</th>
			<th>Started</th>
			<th>Due</th>
			<th>Completed</th>
			<th>Contract Number</th>
		</tr>
	</thead>
	<tbody>
	<g:each in="${projectList}" status="i" var="project">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:link action="show" controller="project" id="${project.id}">${project.name}</g:link></td>
			<td><g:formatDate format="d MMM yyyy" date="${project.start}" />
			<td><g:formatDate format="d MMM yyyy" date="${project.due }"/>
			<td><g:formatDate format="d MMM yyyy" date="${project.completed }"/>
			<td>${project.contractNumber }</td>
			
		</tr>
	</g:each>
	</tbody>
</table>