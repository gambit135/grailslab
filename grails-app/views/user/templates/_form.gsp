<%@ page import="lab.User" %>

<!--User name -->
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}"/>
</div>


<!--Password  field-->
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" />		
	</label>
	<g:passwordField name="password" value="${userInstance?.password}"/>
</div>

