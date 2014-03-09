
<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
	<title><g:message code="balances.label" default="Balances" /></title>
</head>

<body>

<section id="balances" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="user.label" default="User" /></th>
				<th><g:message code="balance.label" default="Balance" /></th>			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${balances}" status="i" var="balance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td>
					${balance.key}
				</td>

				<td>${formatNumber(number: balance.value, type: 'currency', currencyCode: Currency.getInstance('EUR'))}</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
	</div>
</section>

</body>

</html>
