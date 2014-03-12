<%@ page import="de.kantan.BankAccount" %>



			<div class="${hasErrors(bean: bankAccountInstance, field: 'accountHolder', 'error')} required">
				<label for="accountHolder" class="control-label"><g:message code="bankAccount.accountHolder.label" default="Account Holder" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="accountHolder" required="" value="${bankAccountInstance?.accountHolder}"/>
					<span class="help-inline">${hasErrors(bean: bankAccountInstance, field: 'accountHolder', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: bankAccountInstance, field: 'bic', 'error')} ">
				<label for="bic" class="control-label"><g:message code="bankAccount.bic.label" default="Bic" /></label>
				<div>
					<g:textField class="form-control" name="bic" value="${bankAccountInstance?.bic}"/>
					<span class="help-inline">${hasErrors(bean: bankAccountInstance, field: 'bic', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: bankAccountInstance, field: 'iban', 'error')} ">
				<label for="iban" class="control-label"><g:message code="bankAccount.iban.label" default="Iban" /></label>
				<div>
					<g:textField class="form-control" name="iban" value="${bankAccountInstance?.iban}"/>
					<span class="help-inline">${hasErrors(bean: bankAccountInstance, field: 'iban', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: bankAccountInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="bankAccount.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${de.kantan.User.list()}" optionKey="id" required="" value="${bankAccountInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: bankAccountInstance, field: 'user', 'error')}</span>
				</div>
			</div>

