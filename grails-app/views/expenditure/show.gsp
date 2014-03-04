
<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-expenditure" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expenditure.creditor.label" default="Creditor" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${expenditureInstance?.creditor?.id}">${expenditureInstance?.creditor?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expenditure.title.label" default="Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expenditureInstance, field: "title")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expenditure.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expenditureInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expenditure.currency.label" default="Currency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expenditureInstance, field: "currency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expenditure.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${expenditureInstance?.date}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
