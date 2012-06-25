<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Liz Project Tracking</title>
		<style type="text/css" media="screen">
		</style>
	</head>
	<body>
		<g:link action="create" controller="project" class="create">Add New Project</g:link>
		<g:link action="list" controller="project">Show All Projects</g:link>
		<h3>Active Projects</h3>
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
		
		<h3>Recent Time Entries</h3>
		<g:link action="create" controller="timeEntry" class="create">Add New Time Entry</g:link>
		<g:render template="/timeEntry/includeList"/>
	</body>
</html>
