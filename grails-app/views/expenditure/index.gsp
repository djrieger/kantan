
<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-expenditure" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-expenditure" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="expenditure.creditor.label" default="Creditor" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'expenditure.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'expenditure.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="currency" title="${message(code: 'expenditure.currency.label', default: 'Currency')}" />
					
						<g:sortableColumn property="billed" title="${message(code: 'expenditure.billed.label', default: 'Billed')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'expenditure.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${expenditureInstanceList}" status="i" var="expenditureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${expenditureInstance.id}">${fieldValue(bean: expenditureInstance, field: "creditor")}</g:link></td>
					
						<td>${fieldValue(bean: expenditureInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: expenditureInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: expenditureInstance, field: "currency")}</td>
					
						<td><g:formatBoolean boolean="${expenditureInstance.billed}" /></td>
					
						<td><g:formatDate date="${expenditureInstance.date}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${expenditureInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
