<%@ page import="de.kantan.Community" %>
<%@ page import="de.kantan.User" %>
<!-- grails.plugin.springsecurity.SpringSecurityService -->
<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>
<%
    def springSecurityService = grailsApplication.classLoader.loadClass('grails.plugin.springsecurity.SpringSecurityService').newInstance()
%>
<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">

		<g:each status="i" var="c" in="${User.get(springSecurityService.principal.id).communities}">
			<li class="controller">
				<g:link controller="foo" action="index">
					${c.name}
				</g:link>
			</li>
		</g:each>
<!-- 
		<g:each status="i" var="c" in="${grailsApplication.controllerClasses.find { it.logicalPropertyName == 'expenditure' } }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each>
 -->		
	</ul>
</div>
