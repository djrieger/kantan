<%@ page import="de.kantan.Expenditure" %>
<%@ page import="de.kantan.User" %>

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
	<!--  	<bs:datePicker name="date" precision="day"  value="${expenditureInstance?.date}"  />  -->
		  
		<span class="help-inline">${hasErrors(bean: expenditureInstance, field: 'date', 'error')}</span>
	</div>
</div>

<div id="debitors">
	<g:each var="debitorAndShare" in="${expenditureInstance?.debitors}" status="i">
		<g:render template="debitorAndShare" model="['debitorAndShare': debitorAndShare, 'i':i]" />
	</g:each>
</div>


<r:script>
	var childCount = ${expenditureInstance?.debitors?.size() ?: 0} + 0;

	function addDebitor() {
		var clone = $("#debitor_clone").clone()
        var htmlId = 'debitors[' + childCount + '].';
        //var phoneInput = clone.find("input[id$=number]");
 
      clone.find("input[name$=id]").attr('id',htmlId + 'id').attr('name',htmlId + 'id');
      clone.find("input[name$=deleted]").attr('id',htmlId + 'deleted').attr('name',htmlId + 'deleted');
      clone.find("input[name$=new]").attr('id',htmlId + 'new').attr('name',htmlId + 'new').attr('value', 'true');
      //phoneInput.attr('id',htmlId + 'number').attr('name', htmlId + 'number');
      clone.find("select").attr('id', htmlId + 'debitor.id').attr('name', htmlId + 'debitor.id');
      clone.find("input[name$=share]").attr('id', htmlId + 'share').attr('name', htmlId + 'share');

      clone.attr('id', 'debitor' + childCount);
      $("#debitors").append(clone);
      clone.show();
      //phoneInput.focus();
      childCount++;
	}
	
	$(document).on('click', 'a.deleteDebitor', function() {
		//find the parent div
        var prnt = $(this).parents(".debitorDiv");
        //find the deleted hidden input
        var delInput = prnt.find("input[name$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[name$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }    
	});
</r:script>


<a onclick="addDebitor();">Add</a>
