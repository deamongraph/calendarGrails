<%@ page import="practica8_20091275_20101022.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombreusuario', 'error')} required">
	<label for="nombreusuario">
		<g:message code="usuario.nombreusuario.label" default="Nombreusuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreusuario" required="" value="${usuarioInstance?.nombreusuario}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'contrasena', 'error')} required">
	<label for="contrasena">
		<g:message code="usuario.contrasena.label" default="Contrasena" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="contrasena" required="" value="${usuarioInstance?.contrasena}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
	<label for="nombres">
		<g:message code="usuario.nombres.label" default="Nombres" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombres" required="" value="${usuarioInstance?.nombres}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'tiempo', 'error')} required">
	<label for="tiempo">
		<g:message code="usuario.tiempo.label" default="Tiempo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tiempo" type="number" min="0" value="${usuarioInstance.tiempo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'calendariousuario', 'error')} required">
	<label for="calendariousuario">
		<g:message code="usuario.calendariousuario.label" default="Calendariousuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="calendariousuario" name="calendariousuario.id" from="${practica8_20091275_20101022.CalendarioUsuario.list()}" optionKey="id" required="" value="${usuarioInstance?.calendariousuario?.id}" class="many-to-one"/>

</div>

