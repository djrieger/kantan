function disableSelectedOptions(selectElem){
	var selector = (selectElem != null) ? '#' + selectElem : '.debitorDiv:visible select';
	// from http://rndnext.blogspot.de/2009/08/mutually-exclusive-html-select-elements.html
    // List of ids that are selected in all select elements
    var selected = new Array();
    
    // Get a list of the ids that are selected
    $(selector + ' option:selected').each(function() {
        selected.push($(this).val());
    });
    
    // Walk through every select option and enable if not 
    // in the list and not already selected
    $(selector + ' option').each(function() {
        if (!$(this).is(':selected') && $(this).val() != '') {
            var shouldDisable = false;
            for (var i = 0; i < selected.length; i++) {
                if (selected[i] == $(this).val())
                    shouldDisable = true;
            }
            
            $(this).css('text-decoration', '');
            $(this).removeAttr('disabled');
            if (shouldDisable)
            {
                $(this).css('text-decoration', 'line-through');
                $(this).attr('disabled', 'disabled');
            }
        }
    });
}

$(document).ready(function () {
	$(document).on('change', '.debitorDiv:visible select', function() {
		disableSelectedOptions(null);
	});
	
	$('#creditor').on('change', function () {
		var creditorId = this.selectedIndex;
		if (childCount == 0) {
			addDebitor();
			$('#debitor0 select').val(creditorId);	
			disableSelectedOptions(null);		
		}
	});

	// delete debitor
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
	    
	    childCount--;
	    disableSelectedOptions(null);
	});	
	
	$('#creditor').chosen();
	disableSelectedOptions(null);
});

//credit goes to http://omarello.com/2010/08/grails-one-to-many-dynamic-forms/
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
  
    disableSelectedOptions(clone.attr('id'));
    $('#' + clone.attr('id') + ' select').chosen();
}