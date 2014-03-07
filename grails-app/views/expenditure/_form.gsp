<%@ page import="de.kantan.Expenditure" %>
<%@ page import="de.kantan.User" %>

<r:require module="chosen" />

<div class="${hasErrors(bean: expenditureInstance, field: 'creditor', 'error')} required">
	<label for="creditor" class="control-label"><g:message code="expenditure.creditor.label" default="Creditor" /><span class="required-indicator">*</span></label>
	<div>
		<g:select class="form-control" id="creditor" name="creditor.id"
			from="${de.kantan.User.list()}" optionKey="id" required=""
			value="${expenditureInstance?.creditor?.id}" class="many-to-one"
			noSelection="['': 'Bitte wählen']" />
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
	<!--  	<bs:datePicker name="date" precision="day"  value="${expenditureInstance?.date}"  />  -->
		  
		<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'date', 'error')}</span>
	</div>
</div>

<div class="${hasErrors(bean: expenditureInstance, field: 'debitors', 'error')} required">
	<label for="debitors" class="control-label"><g:message code="expenditure.debitors.label" default="Debitors" /><span class="required-indicator">*</span></label>
	<div id="debitors">
		<select id="foo" multiple> 
			<g:each var="user" in="${User.list()}">
				<option value="${user.id}">${user}</option>
			</g:each>
		</select>
	</div>
</div>

<input type="hidden" name="community.id" value="1" />

<r:script>
	function updateTable() {
		var shares = $('#shares');
		//var foo = []; 
		$('#foo option').each(function(i, option){
			var userName = $(option).text();
			var userId = $(option).val();
			var shareRowExists = $('#shareRow' + userId).length > 0;
			var optionSelected = $(option).is(':selected');
			if (optionSelected && !shareRowExists) {
			  	shares.append($('<div/>', { id: 'shareRow' + userId })
			  		  .append($(option).text())
				  	  .append($('<input/>', {
				  	    name: 'debitorsIds[' + userId + ']',
				  		type: 'text',
				  		value: '1'
				  	  })));
			} else if (!optionSelected && shareRowExists) {
				$('#shareRow' + userId).remove();
			}
		});
	}
	
	updateTable();
	$('#foo').chosen({ width: '100%' }).change(updateTable);
</r:script>

<!-- <input type="hidden" name="debitorsIds[0]" value="1" />
<input type="hidden" name="debitorsIds[1]" value="5" />
<input type="hidden" name="debitorsIds[18]" value="1" /> -->
<div id="shares">
</div>


