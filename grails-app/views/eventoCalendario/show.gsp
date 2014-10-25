
<%@ page import="practica8_20091275_20101022.EventoCalendario" %>
<g:set var="entityName" value="${message(code: 'eventoCalendario.label', default: 'eventoCalendario')}" />
<g:applyLayout name="plantillaBootstrap">
    <content tag="header">

    </content>
    <content tag="content">

		<div id="show-eventoCalendario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eventoCalendario">

				<g:if test="${eventoCalendarioInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label text-primary h2"><g:message code="eventoCalendario.startDate.label" default="Start Date:" /></span>

						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${eventoCalendarioInstance?.startDate}" /></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label text-danger h2"><g:message code="eventoCalendario.description.label" default="Description:" /></span>

						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventoCalendarioInstance}" field="description"/></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label text-danger h2"><g:message code="eventoCalendario.usuario.label" default="Usuario:" /></span>

						<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${eventoCalendarioInstance}" field="usuario"/></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.preaviso}">
				<li class="fieldcontain">
					<span id="preaviso-label" class="property-label text-danger h2"><g:message code="eventoCalendario.preaviso.label" default="Preaviso:" /></span>

						<span class="property-value" aria-labelledby="preaviso-label"><g:fieldValue bean="${eventoCalendarioInstance}" field="preaviso"/></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label text-danger h2"><g:message code="eventoCalendario.endDate.label" default="End Date:" /></span>

						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${eventoCalendarioInstance?.endDate}" /></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.allDay}">
				<li class="fieldcontain">
					<span id="allDay-label" class="property-label text-danger h2"><g:message code="eventoCalendario.allDay.label" default="All Day:" /></span>

						<span class="property-value" aria-labelledby="allDay-label"><g:formatBoolean boolean="${eventoCalendarioInstance?.allDay}" /></span>

				</li>
				</g:if>

				<g:if test="${eventoCalendarioInstance?.notificado}">
				<li class="fieldcontain">
					<span id="notificado-label" class="property-label text-danger h2"><g:message code="eventoCalendario.notificado.label" default="Notificado:" /></span>

						<span class="property-value" aria-labelledby="notificado-label"><g:formatBoolean boolean="${eventoCalendarioInstance?.notificado}" /></span>

				</li>
				</g:if>

			</ol>
			<g:form url="[resource:eventoCalendarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-danger" action="edit" resource="${eventoCalendarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-success" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
    </content>
</g:applyLayout>