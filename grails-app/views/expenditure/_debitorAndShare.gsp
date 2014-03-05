<%@ page import="de.kantan.User" %>

<div rowId="${i}">
	<select name="debitors[${i}].debitor.id">
		<g:each var="user" in="${User.list()}">
			<option value="${user.id}" ${ user == debitorAndShare.debitor ? 'selected' : '' }>${user}</option>
		</g:each>
	</select>
	${debitorAndShare.share}
</div>