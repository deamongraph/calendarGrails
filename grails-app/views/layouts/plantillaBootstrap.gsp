<%@ page import="practica8_20091275_20101022.EventoCalendario" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><g:layoutTitle default="Mis Contactos"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'fullcalendar.css')}" />
    <asset:stylesheet src="principal.css"/>
    <asset:javascript src="principal.js" />


    <style>
    body{margin-top: 70px;}
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link rel="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"></script>
    <![endif]-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <g:layoutHead/>
</head>

<body>

<div class="container">
    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Calendar</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><g:link uri="/"><i class="fa fa-home"></i> Inicio </g:link></li>

                </ul>
                <% if(session.user){%>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle fa fa-calendar" data-toggle="dropdown">Calendario <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><g:link class="listAsCalendar" action="listAsCalendar"><i class="fa fa-calendar"></i> Calendario </g:link></li>
                            <li><g:link class="create" action="create"> <i class="fa fa-plus"></i>Nuevo evento</g:link></li>
                            <li class="divider"></li>

                        </ul>
                    </li>

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
    <div class="row">
        <div class="col-md-12">
            <h1>
                <g:pageProperty name="page.header">

                </g:pageProperty>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <g:pageProperty name="page.content">

            </g:pageProperty>
        </div>
        <div class="col-md-4">
            <g:pageProperty name="page.sidebar">

            </g:pageProperty>
        </div>
    </div>

</div>

</body>
</html>