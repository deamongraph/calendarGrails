<%@ page import="practica8_20091275_20101022.EventoCalendario" %>



<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="eventoCalendario.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="minute"  value="${eventoCalendarioInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="eventoCalendario.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${eventoCalendarioInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="eventoCalendario.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="usuario" required="" value="${sec.username()}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'preaviso', 'error')} required">
	<label for="preaviso">
		<g:message code="eventoCalendario.preaviso.label" default="Preaviso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preaviso" type="number" value="${eventoCalendarioInstance.preaviso}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="eventoCalendario.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="minute"  value="${eventoCalendarioInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'allDay', 'error')} ">
	<label for="allDay">
		<g:message code="eventoCalendario.allDay.label" default="All Day" />
		
	</label>
	<g:checkBox name="allDay" value="${eventoCalendarioInstance?.allDay}" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventoCalendarioInstance, field: 'notificado', 'error')} ">
	<label for="notificado">
		<g:message code="eventoCalendario.notificado.label" default="Notificado" />
		
	</label>
	<g:checkBox name="notificado" value="${eventoCalendarioInstance?.notificado}" />

</div>

