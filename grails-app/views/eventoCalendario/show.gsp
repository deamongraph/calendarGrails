
<%@ page import="practica8_20091275_20101022.EventoCalendario" %>
<!DOCTYPE html>
<html>
	<head>

        <!-- add following references to use jQuery and its plugins -->
        <g:javascript src="jquery/jquery-1.3.2.min.js" />
        <g:javascript src="jquery/fullcalendar.min.js" />
        <g:javascript src="jquery/jquery.ui.core.js" />
        <g:javascript src="jquery/jquery.ui.draggable.js" />
        <g:javascript src="jquery/jquery.qtip-1.0.0-rc3.min.js" />
        <g:javascript src="${createLinkTo(dir:'javascripts',file:'principal.js')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'principal.css')}" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link rel="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"></script>
    <![endif]-->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<g:set var="entityName" value="${message(code: 'eventoCalendario.label', default: 'EventoCalendario')}" />

		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"> Calendar</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><g:link uri="/"><i class="fa fa-home"></i> Inicio </g:link></li>

                </ul>
                <% if(session.user){%>
                <ul class="nav navbar-nav">
                    <li><g:link class="create" action="listAsCalendar"> <i class="fa fa-backward"></i> Volver</g:link></li>

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.user.username %> <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><%= session.user.username %></a></li>
                            <li class="divider"></li>
                            <li><g:link controller="user" action="logout">Salir</g:link></li>
                        </ul>
                    </li>
                </ul>
                <%}%>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <g:link controller="user" action="login">Login</g:link>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
    <div class="jumbotron">
		<div id="show-eventoCalendario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eventoCalendario">

				<g:if test="${eventoCalendarioInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label text-danger h2"><g:message code="eventoCalendario.startDate.label" default="Start Date:" /></span>

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

				<g:if test="${eventoCalendarioInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label text-danger h2"><g:message code="eventoCalendario.endDate.label" default="End Date:" /></span>

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
					<g:link class="btn btn-warning" action="edit" resource="${eventoCalendarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
    </div>
	</body>
</html>
