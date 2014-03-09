
<%@ page import="de.kantan.Settlement" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settlement.label', default: 'Settlement')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-settlement" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settlement.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${settlementInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settlement.expenditures.label" default="Expenditures" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${settlementInstance.expenditures}" var="e">
						<li><g:link controller="expenditure" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settlement.transactions.label" default="Transactions" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${settlementInstance.transactions}" var="t">
						<li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
