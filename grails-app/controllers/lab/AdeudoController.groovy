package lab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdeudoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Adeudo.list(params), model:[adeudoInstanceCount: Adeudo.count()]
    }

    def show(Adeudo adeudoInstance) {
        respond adeudoInstance
    }

    def create() {
        respond new Adeudo(params)
    }

    @Transactional
    def save(Adeudo adeudoInstance) {
        if (adeudoInstance == null) {
            notFound()
            return
        }

        if (adeudoInstance.hasErrors()) {
            respond adeudoInstance.errors, view:'create'
            return
        }

        adeudoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'adeudoInstance.label', default: 'Adeudo'), adeudoInstance.id])
                redirect adeudoInstance
            }
            '*' { respond adeudoInstance, [status: CREATED] }
        }
    }

    def edit(Adeudo adeudoInstance) {
        respond adeudoInstance
    }

    @Transactional
    def update(Adeudo adeudoInstance) {
        if (adeudoInstance == null) {
            notFound()
            return
        }

        if (adeudoInstance.hasErrors()) {
            respond adeudoInstance.errors, view:'edit'
            return
        }

        adeudoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Adeudo.label', default: 'Adeudo'), adeudoInstance.id])
                redirect adeudoInstance
            }
            '*'{ respond adeudoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Adeudo adeudoInstance) {

        if (adeudoInstance == null) {
            notFound()
            return
        }

        adeudoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Adeudo.label', default: 'Adeudo'), adeudoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'adeudoInstance.label', default: 'Adeudo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
