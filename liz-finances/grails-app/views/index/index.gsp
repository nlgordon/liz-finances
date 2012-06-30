<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Liz Project Tracking</title>
		<style type="text/css" media="screen">
		</style>
	</head>
	<body>
		<h3>Active Projects</h3>
		<g:link action="create" controller="project" class="create">Add New</g:link>
		<g:link action="list" controller="project">Show All</g:link>
		<g:render template="/project/includeList"/>
		
		<h3>Recent Time Entries</h3>
		<g:link action="create" controller="timeEntry" class="create">Add New</g:link>
		<g:link action="list" controller="timeEntry">Show All</g:link>
		<g:render template="/timeEntry/includeList"/>
		
		<h3>Recent Account Entries</h3>
		<g:link action="create" controller="accountEntry" class="create">Add New</g:link>
		<g:link action="list" controller="accountEntry">Show All</g:link>
		<g:render template="/accountEntry/includeList"/>
	</body>
</html>
