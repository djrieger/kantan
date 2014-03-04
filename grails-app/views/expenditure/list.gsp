
<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-expenditure" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="expenditure.creditor.label" default="Creditor" /></th>
			
				<g:sortableColumn property="title" title="${message(code: 'expenditure.title.label', default: 'Title')}" />
			
				<g:sortableColumn property="amount" title="${message(code: 'expenditure.amount.label', default: 'Amount')}" />
			
				<g:sortableColumn property="date" title="${message(code: 'expenditure.date.label', default: 'Date')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${expenditureInstanceList}" status="i" var="expenditureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${expenditureInstance.id}">${fieldValue(bean: expenditureInstance, field: "creditor")}</g:link></td>
			
				<td>${fieldValue(bean: expenditureInstance, field: "title")}</td>

				<td>${formatNumber(number: expenditureInstance.amount, type: 'currency', currencyCode: expenditureInstance.currency.getCurrencyCode())}</td>
			
			
				<td><g:formatDate date="${expenditureInstance.date}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${expenditureInstanceCount}" />
	</div>
</section>

</body>

</html>
