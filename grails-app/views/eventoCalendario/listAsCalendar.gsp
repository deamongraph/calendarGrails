

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Calendar View</title>

    <!-- add following references to use jQuery and its plugins -->
    <g:javascript src="jquery/jquery-1.3.2.min.js" />
    <g:javascript src="jquery/fullcalendar.min.js" />
    <g:javascript src="jquery/jquery.ui.core.js" />
    <g:javascript src="jquery/jquery.ui.draggable.js" />
    <g:javascript src="jquery/jquery.qtip-1.0.0-rc3.min.js" />

    <!--  FullCalendar css resource-->
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'fullcalendar.css')}" />
    <style type='text/css'>
    #loading {
        position: absolute;
        top: 5px;
        right: 5px;
    }

    #calendar {
        width: 900px;
        margin: 0 auto;
    }

    table {
        border:#FFF;
    }

    </style>

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

<div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">CalendarEvent List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New CalendarEvent</g:link></span>
</div>
<div class="body">
    <h1>Calendar View</h1>
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
