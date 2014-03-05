<%@ page import="de.kantan.User" %>

<div class="debitorDiv" id="debitor${i}" <g:if test="${hidden}">style="display:none;"</g:if>>	
	<input type="hidden" name="debitors[${i}].deleted" value="false" />
	<input type="hidden" name="debitors[${i}].new" value="false" />
	<select name="debitors[${i}].debitor.id">
		<g:each var="user" in="${User.list()}">
			<option value="${user.id}" ${ user == debitorAndShare?.debitor ? 'selected' : '' }>${user}</option>
		</g:each>
		<g:if test="${hidden}">
			<option selected>Bitte wählen</option>
		</g:if>
	</select>
	<input type="number" name="debitors[${i}].share" value="${debitorAndShare?.share ?: 1}" min="1" />
	<a class="deleteDebitor">Delete</a>
</div>