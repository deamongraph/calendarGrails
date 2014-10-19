
<%@ page import="practica8_20091275_20101022.EventoCalendario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventoCalendario.label', default: 'EventoCalendario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-eventoCalendario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-eventoCalendario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eventoCalendario">
			
				<g:if test="${eventoCalendarioInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="eventoCalendario.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${eventoCalendarioInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoCalendarioInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="eventoCalendario.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventoCalendarioInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoCalendarioInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="eventoCalendario.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${eventoCalendarioInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoCalendarioInstance?.allDay}">
				<li class="fieldcontain">
					<span id="allDay-label" class="property-label"><g:message code="eventoCalendario.allDay.label" default="All Day" /></span>
					
						<span class="property-value" aria-labelledby="allDay-label"><g:formatBoolean boolean="${eventoCalendarioInstance?.allDay}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eventoCalendarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventoCalendarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
