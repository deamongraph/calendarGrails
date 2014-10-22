
<%@ page import="practica8_20091275_20101022.EventoCalendario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventoCalendario.label', default: 'EventoCalendario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-eventoCalendario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-eventoCalendario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'eventoCalendario.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'eventoCalendario.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="usuario" title="${message(code: 'eventoCalendario.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'eventoCalendario.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="allDay" title="${message(code: 'eventoCalendario.allDay.label', default: 'All Day')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoCalendarioInstanceList}" status="i" var="eventoCalendarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoCalendarioInstance.id}">${fieldValue(bean: eventoCalendarioInstance, field: "startDate")}</g:link></td>
					
						<td>${fieldValue(bean: eventoCalendarioInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: eventoCalendarioInstance, field: "usuario")}</td>
					
						<td><g:formatDate date="${eventoCalendarioInstance.endDate}" /></td>
					
						<td><g:formatBoolean boolean="${eventoCalendarioInstance.allDay}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventoCalendarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
