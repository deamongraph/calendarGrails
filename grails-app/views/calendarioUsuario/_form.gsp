<%@ page import="practica8_20091275_20101022.CalendarioUsuario" %>



<div class="fieldcontain ${hasErrors(bean: calendarioUsuarioInstance, field: 'eventos', 'error')} ">
	<label for="eventos">
		<g:message code="calendarioUsuario.eventos.label" default="Eventos" />
		
	</label>
	<g:select id="eventos" name="eventos.id" from="${practica8_20091275_20101022.EventoCalendario.list()}" optionKey="id" value="${calendarioUsuarioInstance?.eventos?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calendarioUsuarioInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="calendarioUsuario.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${practica8_20091275_20101022.Usuario.list()}" optionKey="id" value="${calendarioUsuarioInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calendarioUsuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="calendarioUsuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${calendarioUsuarioInstance?.nombre}"/>

</div>

