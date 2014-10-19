package practica8_20091275_20101022


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CalendarioUsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CalendarioUsuario.list(params), model: [calendarioUsuarioInstanceCount: CalendarioUsuario.count()]
    }

    def show(CalendarioUsuario calendarioUsuarioInstance) {
        respond calendarioUsuarioInstance
    }

    def create() {
        respond new CalendarioUsuario(params)
    }

    @Transactional
    def save(CalendarioUsuario calendarioUsuarioInstance) {
        if (calendarioUsuarioInstance == null) {
            notFound()
            return
        }

        if (calendarioUsuarioInstance.hasErrors()) {
            respond calendarioUsuarioInstance.errors, view: 'create'
            return
        }

        calendarioUsuarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'calendarioUsuario.label', default: 'CalendarioUsuario'), calendarioUsuarioInstance.id])
                redirect calendarioUsuarioInstance
            }
            '*' { respond calendarioUsuarioInstance, [status: CREATED] }
        }
    }

    def edit(CalendarioUsuario calendarioUsuarioInstance) {
        respond calendarioUsuarioInstance
    }

    @Transactional
    def update(CalendarioUsuario calendarioUsuarioInstance) {
        if (calendarioUsuarioInstance == null) {
            notFound()
            return
        }

        if (calendarioUsuarioInstance.hasErrors()) {
            respond calendarioUsuarioInstance.errors, view: 'edit'
            return
        }

        calendarioUsuarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CalendarioUsuario.label', default: 'CalendarioUsuario'), calendarioUsuarioInstance.id])
                redirect calendarioUsuarioInstance
            }
            '*' { respond calendarioUsuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CalendarioUsuario calendarioUsuarioInstance) {

        if (calendarioUsuarioInstance == null) {
            notFound()
            return
        }

        calendarioUsuarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CalendarioUsuario.label', default: 'CalendarioUsuario'), calendarioUsuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'calendarioUsuario.label', default: 'CalendarioUsuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
