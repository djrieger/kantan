<%@ page import="de.kantan.Expenditure" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expenditure.label', default: 'Expenditure')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-expenditure" class="first">

		<g:hasErrors bean="${expenditureInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${expenditureInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${expenditureInstance?.id}" />
			<g:hiddenField name="version" value="${expenditureInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />
			
			<g:render template="form"/>
			
			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>
		<g:render template="debitorAndShare" model="['debitorAndShare': null, 'i': '_clone', 'hidden': true]" />
	</section>

</body>

</html>
