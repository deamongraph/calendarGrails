package practica8_20091275_20101022

import grails.converters.JSON

import static org.grails.datastore.gorm.GormStaticApi.count
import static org.grails.datastore.gorm.GormStaticApi.findAll
import static org.grails.datastore.gorm.GormStaticApi.list
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventoCalendarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventoCalendario.list(params), model: [eventoCalendarioInstanceCount: EventoCalendario.count()]
    }

    def show(EventoCalendario eventoCalendarioInstance) {
        respond eventoCalendarioInstance
    }

    def create() {
        respond new EventoCalendario(params)
    }
    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ EventoCalendarioInstanceList: list( params ), EventoCalendarioInstanceTotal: count() ]
    }

    def listAsJson = {

        //get parameter 'startDate', 'endDate' from request
        def fcal = Calendar.getInstance()
        if(params.start) fcal.setTime(new Date(Long.parseLong(params.start)))
        def lcal = Calendar.getInstance()
        if(params.end) lcal.setTime(new Date(Long.parseLong(params.end)))

        //query events from database
        def listOfEvents = findAll("from EventoCalendario as \
			ce where ce.startDate>:startDate AND ce.endDate<:endDate", \
			[startDate: fcal.getTime(), endDate: lcal.getTime()])

        //construct returned event data
        def listOfJsEvents = []
        listOfEvents.each{ event->
            def jsEvent = [:]
            jsEvent.id = event.id
            jsEvent.title = event.description?.length()>15? \
				event.description?.substring(0, 14)+"..." : event.description
            jsEvent.description = event.description
            jsEvent.start = event.startDate
            jsEvent.end = event.endDate
            jsEvent.showTime = true
            jsEvent.url = "show?id=${event.id}"
            jsEvent.className = "scheduled"
            jsEvent.allDay = event.allDay
            listOfJsEvents.add(jsEvent)
        }

        //render java object list to JSON data
        render listOfJsEvents as JSON
    }
    def listAsCalendar = {
    }
    def deletedWithJson = {
        def resultAsJson = [result: "success", message: "The event has been deleted."]

        //get event id from request
        def calendarEventInstance = CalendarEvent.get( params.id )

        //try to delete event from database
        if(calendarEventInstance) {
            try {
                calendarEventInstance.delete()
                flash.message = "CalendarEvent ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                resultAsJson.result = "fail"
                resultAsJson.message = "Database error, failed to delete the event."
            }
        }
        else {
            //construct failure result
            resultAsJson.result = "fail"
            resultAsJson.message = "CalendarEvent not found in database."
        }

        //render result as JSON data
        render resultAsJson as JSON
    }
    @Transactional
    def save(EventoCalendario eventoCalendarioInstance) {
        if (eventoCalendarioInstance == null) {
            notFound()
            return
        }

        if (eventoCalendarioInstance.hasErrors()) {
            respond eventoCalendarioInstance.errors, view: 'create'
            return
        }

        eventoCalendarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventoCalendario.label', default: 'EventoCalendario'), eventoCalendarioInstance.id])
                redirect eventoCalendarioInstance
            }
            '*' { respond eventoCalendarioInstance, [status: CREATED] }
        }
    }

    def edit(EventoCalendario eventoCalendarioInstance) {
        respond eventoCalendarioInstance
    }

    @Transactional
    def update(EventoCalendario eventoCalendarioInstance) {
        if (eventoCalendarioInstance == null) {
            notFound()
            return
        }

        if (eventoCalendarioInstance.hasErrors()) {
            respond eventoCalendarioInstance.errors, view: 'edit'
            return
        }

        eventoCalendarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventoCalendario.label', default: 'EventoCalendario'), eventoCalendarioInstance.id])
                redirect eventoCalendarioInstance
            }
            '*' { respond eventoCalendarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventoCalendario eventoCalendarioInstance) {

        if (eventoCalendarioInstance == null) {
            notFound()
            return
        }

        eventoCalendarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventoCalendario.label', default: 'EventoCalendario'), eventoCalendarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventoCalendario.label', default: 'EventoCalendario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}