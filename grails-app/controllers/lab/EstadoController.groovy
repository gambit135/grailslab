package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class EstadoController {

    def index() {
    	params.max = 10
 		respond Estado.list(params), model:[estados: Estado.list(params), estadoInstanceCount: Estado.count()] 	
    }

    def show(Estado estadoInstance){
    	respond estadoInstance    	
    }
    def create() {
        respond new Estado(params)
    }

    def edit(Estado estadoInstance) {
        respond estadoInstance
    }


    @Transactional
    def save(Estado estadoInstance) {
        if (estadoInstance == null) {
            notFound()
            return
        }

        if (estadoInstance.hasErrors()) {
            respond estadoInstance.errors, view:'create'
            return
        }

        estadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Estado', 
												default: 'Estado'
												), 
											estadoInstance.id])
                redirect estadoInstance
            }
            '*' { respond estadoInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Estado estadoInstance) {
        if (estadoInstance == null) {
            notFound()
            return
        }

        if (estadoInstance.hasErrors()) {
            respond estadoInstance.errors, view:'edit'
            return
        }

        estadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Estado', 
												default: 'Estado'), 
										estadoInstance.id])
                redirect estadoInstance
            }
            '*'{ respond estadoInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Estado estadoInstance) {

        if (estadoInstance == null) {
            notFound()
            return
        }

        estadoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'estado.deleted.message', args: [message(code: 'Estado', default: 'Estado'), estadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
