<%@ page import="de.kantan.Expenditure" %>



			<div class="${hasErrors(bean: expenditureInstance, field: 'creditor', 'error')} required">
				<label for="creditor" class="control-label"><g:message code="expenditure.creditor.label" default="Creditor" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="creditor" name="creditor.id" from="${de.kantan.User.list()}" optionKey="id" required="" value="${expenditureInstance?.creditor?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'creditor', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: expenditureInstance, field: 'title', 'error')} required">
				<label for="title" class="control-label"><g:message code="expenditure.title.label" default="Title" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="title" required="" value="${expenditureInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: expenditureInstance, field: 'amount', 'error')} required">
				<label for="amount" class="control-label"><g:message code="expenditure.amount.label" default="Amount" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="amount" value="${fieldValue(bean: expenditureInstance, field: 'amount')}" required=""/>
					<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'amount', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: expenditureInstance, field: 'currency', 'error')} required">
				<label for="currency" class="control-label"><g:message code="expenditure.currency.label" default="Currency" /><span class="required-indicator">*</span></label>
				<div>
					<g:currencySelect class='form-control' name="currency" value="${expenditureInstance?.currency}"  />
					<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: expenditureInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="expenditure.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="date" precision="day"  value="${expenditureInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'date', 'error')}</span>
				</div>
			</div>

