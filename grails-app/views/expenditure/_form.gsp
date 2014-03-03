<%@ page import="de.kantan.Expenditure" %>



<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'creditor', 'error')} required">
	<label for="creditor">
		<g:message code="expenditure.creditor.label" default="Creditor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creditor" name="creditor.id" from="${de.kantan.User.list()}" optionKey="id" required="" value="${expenditureInstance?.creditor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="expenditure.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${expenditureInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="expenditure.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: expenditureInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'currency', 'error')} required">
	<label for="currency">
		<g:message code="expenditure.currency.label" default="Currency" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="currency" value="${expenditureInstance?.currency}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'billed', 'error')} ">
	<label for="billed">
		<g:message code="expenditure.billed.label" default="Billed" />
		
	</label>
	<g:checkBox name="billed" value="${expenditureInstance?.billed}" />

</div>

<div class="fieldcontain ${hasErrors(bean: expenditureInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="expenditure.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${expenditureInstance?.date}"  />

</div>

