
<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-expenditure" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-expenditure" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list expenditure">
			
				<g:if test="${expenditureInstance?.creditor}">
				<li class="fieldcontain">
					<span id="creditor-label" class="property-label"><g:message code="expenditure.creditor.label" default="Creditor" /></span>
					
						<span class="property-value" aria-labelledby="creditor-label"><g:link controller="user" action="show" id="${expenditureInstance?.creditor?.id}">${expenditureInstance?.creditor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${expenditureInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="expenditure.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${expenditureInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${expenditureInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="expenditure.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${expenditureInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${expenditureInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="expenditure.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${expenditureInstance}" field="currency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${expenditureInstance?.billed}">
				<li class="fieldcontain">
					<span id="billed-label" class="property-label"><g:message code="expenditure.billed.label" default="Billed" /></span>
					
						<span class="property-value" aria-labelledby="billed-label"><g:formatBoolean boolean="${expenditureInstance?.billed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${expenditureInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="expenditure.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${expenditureInstance?.date}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:expenditureInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${expenditureInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
