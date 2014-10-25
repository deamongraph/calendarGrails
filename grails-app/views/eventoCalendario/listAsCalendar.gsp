

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>Calendar View</title>

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
    <!--  FullCalendar css resource-->
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'fullcalendar.css')}" />


</head>
<body>
<g:javascript>
    //js method to send and handle cancelling event request to server side.

    function cancelEvent(id) {
        $.ajax({
            // url pointing to calendar controller 'deletedWithJson' operation
            url: 'deletedWithJson',
            type: 'GET',
            data: {id:id},
            dataType: 'json',
            timeout: 1000,
            error: function(){
                //timeout error
                alert('Error can not connect to server.');
            },
            success: function(data){
                //database deletion error
                if(data.result=='fail'){
                    alert('Error delete event in database');
                }else {
                    //remove event object from UI
                    $('#calendar').fullCalendar('removeEvents', id);
                }
            }
        });
    }

    $(document).ready(function() {

        //initialize calendar UI
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: function(start, end, callback) {
                //call 'listAsJson' operation to retrieve calendar JSON data.
                $.getJSON("listAsJson",
                        {
                            start: start.getTime(),
                            end: end.getTime()
                        },
                        function(result) {

                            //reset timezone from server
                            for(var i=0;i<result.length; i++){
                                result[i].start = $.fullCalendar.parseISO8601(result[i].start, false);
                                result[i].end = $.fullCalendar.parseISO8601(result[i].end, false);
                            }

                            callback(result);
                        });

            },
            loading: function(bool) {
                //show 'loading' when loading is not completed
                if (bool) $('#loading').show();
                else $('#loading').hide();
            },
            eventRender: function(calEvent, element) {
                //initialize qTip for all event object on UI
                element.qtip({
                    content:
                            '<p><b>Description</b>:<br/>'+calEvent.description+'</p><br/>\
<p><b>Start</b>:<br/>'+calEvent.start+'</p><br/>\
<p><b>End</b>:<br/>'+calEvent.end+'</p><br/>\
<p><input type="button" onclick=\"cancelEvent('+calEvent.id+');\"\
	value=\"Cancel\"></p>',
                    position: {
                        corner: {
                            target:'rightTop',
                            tooltip:'leftBottom'
                        }
                    },
                    show: {solo: true},
                    hide: {
                        delay: 800
                    },
                    style: {
                        border:{
                            radius: 8,
                            width: 3
                        },
                        padding: '5px 15px', // Give it some extra padding
                        tip: true,
                        name: 'cream' // And style it with the preset dark theme
                    }
                });
                return element;
            }
        });

    });
</g:javascript>

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

            <ul class="nav navbar-nav">
            <li><g:link class="create" action="create"> <i class="fa fa-plus"></i>Nuevo evento</g:link></li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= sec.username() %> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><%=sec.username() %></a></li>
                        <li class="divider"></li>
                        <li><g:link controller="user" action="logout">Salir</g:link></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <g:link controller="user" action="login">Login</g:link>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<div class="jumbotron col-xs-8 center-block">
    <h1>Calendario</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <div id='loading' style='display:none'>loading...</div>
        <div id='calendar'></div>
    </div>


</div>
</body>
</html>
