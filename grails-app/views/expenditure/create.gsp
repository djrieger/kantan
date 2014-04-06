<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-expenditure" class="first">

		<g:hasErrors bean="${expenditureInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${expenditureInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</div>
		</g:form>
		<g:render template="debitorAndShare" model="['debitorAndShare': null, 'i': '_clone', 'hidden': true]" />
	</section>

</body>

</html>
