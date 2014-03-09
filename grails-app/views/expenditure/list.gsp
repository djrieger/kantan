
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
			

				<g:sortableColumn property="dateCreated" title="${message(code: 'expenditure.date.label', default: 'Date')}" />

				<g:sortableColumn property="title" titleKey="${message(code: 'expenditure.title.label', default: 'Title')}" />

				<g:sortableColumn property="user.username" titleKey="expenditure.creditor.label" title="Creditor" />
			
			
				<g:sortableColumn property="amount" title="${message(code: 'expenditure.amount.label', default: 'Amount')}" />
			
				<th><g:message code="expenditure.debitors.label" default="Für wen" /></th>
			
				<!--<g:sortableColumn property="date" title="${message(code: 'expenditure.date.label', default: 'Date')}" />-->
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${expenditureInstanceList}" status="i" var="expenditureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td>
				<abbr title="<g:formatDate date="${expenditureInstance.dateCreated}" />">
					<prettytime:display date="${expenditureInstance.dateCreated}" />
				</abbr>
				</td>

				<td>${fieldValue(bean: expenditureInstance, field: "title")}</td>
			
				<td><g:link action="show" id="${expenditureInstance.id}">${fieldValue(bean: expenditureInstance, field: "creditor")}</g:link></td>
			

				<td>${formatNumber(number: expenditureInstance.amount, type: 'currency', currencyCode: expenditureInstance.currency.getCurrencyCode())}</td>
			
				<!--  <td><g:formatDate date="${expenditureInstance.date}" /></td>-->
			
				<td>
					<g:set var="uniqueDebitors" value="${expenditureInstance.debitors.unique(false)}" />
					<g:each var="debitor" in="${uniqueDebitors}" status="status">
						${debitor.username}
						<g:set var="guests" value="${ Collections.frequency(expenditureInstance.debitors, debitor) - 1 }" />
						<g:if test="${ guests == 1 }">
							<g:message code="expenditure.oneAdditionalGuest.label" default="(+ 1 guest)" />
						</g:if>
						<g:elseif test="${ guests > 1 }">
							<g:message code="expenditure.multipleAdditionalGuests.label" default="(+ guests)" args="${ [ guests ] }" />
						</g:elseif>
						<g:if test="${ status < uniqueDebitors.size() - 1 }">
							,
						</g:if>
					</g:each>
				</td>
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
