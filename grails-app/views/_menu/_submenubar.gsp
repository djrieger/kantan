<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
}">
	<ul id="Menu" class="nav nav-pills margin-top-small">
		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		
		<g:if test="${params.controller == 'expenditure' || params.controller == 'settlement' }">
			<li class="${ params.controller == "expenditure" && params.action == "balances" ? 'active' : '' }">
				<g:link controller="expenditure" action="balances"><i class="glyphicon glyphicon-th-list"></i> <g:message code="expenditure.balances.label" default="Balances"/></g:link>
			</li>
			
			<li class="${ params.controller == "expenditure" && params.action == "list" ? 'active' : '' }">
				<g:link controller="expenditure" action="list"><i class="glyphicon glyphicon-th-list"></i> <g:message code="expenditure.list.label" default="Expenditures"/></g:link>
			</li>
			
			<li class="${ params.controller == "settlement" && params.action == "list" ? 'active' : '' }">
				<g:link controller="settlement" action="list"><i class="glyphicon glyphicon-th-list"></i> <g:message code="settlement.list.label" default="Settlements"/></g:link>
			</li>
		</g:if>
		
		<!-- 
		<li class="${ params.action == "list" ? 'active' : '' }">
			<g:link action="list"><i class="glyphicon glyphicon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
		</li>
		<li class="${ params.action == "create" ? 'active' : '' }">
			<g:link action="create"><i class="glyphicon glyphicon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
		</li>
		
		<g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<li class="${ params.action == "edit" ? 'active' : '' }">
				<g:link action="edit" id="${params.id}"><i class="glyphicon glyphicon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
			</li>
			<li class="">
				<g:render template="/_common/modals/deleteTextLink"/>
			</li>
		</g:if>
		 -->
	</ul>
</g:if>
