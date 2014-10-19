
<%@ page import="practica8_20091275_20101022.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.nombreusuario}">
				<li class="fieldcontain">
					<span id="nombreusuario-label" class="property-label"><g:message code="usuario.nombreusuario.label" default="Nombreusuario" /></span>
					
						<span class="property-value" aria-labelledby="nombreusuario-label"><g:fieldValue bean="${usuarioInstance}" field="nombreusuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.contrasena}">
				<li class="fieldcontain">
					<span id="contrasena-label" class="property-label"><g:message code="usuario.contrasena.label" default="Contrasena" /></span>
					
						<span class="property-value" aria-labelledby="contrasena-label"><g:fieldValue bean="${usuarioInstance}" field="contrasena"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.nombres}">
				<li class="fieldcontain">
					<span id="nombres-label" class="property-label"><g:message code="usuario.nombres.label" default="Nombres" /></span>
					
						<span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${usuarioInstance}" field="nombres"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.tiempo}">
				<li class="fieldcontain">
					<span id="tiempo-label" class="property-label"><g:message code="usuario.tiempo.label" default="Tiempo" /></span>
					
						<span class="property-value" aria-labelledby="tiempo-label"><g:fieldValue bean="${usuarioInstance}" field="tiempo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.calendario}">
				<li class="fieldcontain">
					<span id="calendario-label" class="property-label"><g:message code="usuario.calendario.label" default="Calendario" /></span>
					
						<span class="property-value" aria-labelledby="calendario-label"><g:link controller="eventoCalendario" action="show" id="${usuarioInstance?.calendario?.id}">${usuarioInstance?.calendario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
