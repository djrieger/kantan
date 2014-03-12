
<%@ page import="de.kantan.BankAccount" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-bankAccount" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="accountHolder" title="${message(code: 'bankAccount.accountHolder.label', default: 'Account Holder')}" />
			
				<g:sortableColumn property="bic" title="${message(code: 'bankAccount.bic.label', default: 'Bic')}" />
			
				<g:sortableColumn property="iban" title="${message(code: 'bankAccount.iban.label', default: 'Iban')}" />
			
				<th><g:message code="bankAccount.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bankAccountInstanceList}" status="i" var="bankAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${bankAccountInstance.id}">${fieldValue(bean: bankAccountInstance, field: "accountHolder")}</g:link></td>
			
				<td>${fieldValue(bean: bankAccountInstance, field: "bic")}</td>
			
				<td>${fieldValue(bean: bankAccountInstance, field: "iban")}</td>
			
				<td>${fieldValue(bean: bankAccountInstance, field: "user")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${bankAccountInstanceCount}" />
	</div>
</section>

</body>

</html>
