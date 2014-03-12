
<%@ page import="de.kantan.BankAccount" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-bankAccount" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bankAccount.accountHolder.label" default="Account Holder" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "accountHolder")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bankAccount.bic.label" default="Bic" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "bic")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bankAccount.iban.label" default="Iban" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "iban")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bankAccount.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${bankAccountInstance?.user?.id}">${bankAccountInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
