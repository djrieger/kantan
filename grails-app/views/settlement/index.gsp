
<%@ page import="de.kantan.Settlement" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settlement.label', default: 'Settlement')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-settlement" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'settlement.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${settlementInstanceList}" status="i" var="settlementInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${settlementInstance.id}">${fieldValue(bean: settlementInstance, field: "dateCreated")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${settlementInstanceCount}" />
	</div>
</section>

</body>

</html>
