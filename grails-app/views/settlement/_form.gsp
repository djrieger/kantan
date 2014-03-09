<%@ page import="de.kantan.Settlement" %>



			<div class="${hasErrors(bean: settlementInstance, field: 'expenditures', 'error')} ">
				<label for="expenditures" class="control-label"><g:message code="settlement.expenditures.label" default="Expenditures" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${settlementInstance?.expenditures?}" var="e">
    <li><g:link controller="expenditure" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="expenditure" action="create" params="['settlement.id': settlementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'expenditure.label', default: 'Expenditure')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: settlementInstance, field: 'expenditures', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: settlementInstance, field: 'transactions', 'error')} ">
				<label for="transactions" class="control-label"><g:message code="settlement.transactions.label" default="Transactions" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${settlementInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['settlement.id': settlementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: settlementInstance, field: 'transactions', 'error')}</span>
				</div>
			</div>

