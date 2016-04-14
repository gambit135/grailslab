package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class PeriodoController {

    def index() {
    	params.max = 10
 		respond Periodo.list(params), model:[periodos: Periodo.list(params), periodoInstanceCount: Periodo.count()] 	
    }

    def show(Periodo periodoInstance){
    	respond periodoInstance    	
    }
    def create() {
        respond new Periodo(params)
    }

    def edit(Periodo periodoInstance) {
        respond periodoInstance
    }


    @Transactional
    def save(Periodo periodoInstance) {
        if (periodoInstance == null) {
            notFound()
            return
        }

        if (periodoInstance.hasErrors()) {
            respond periodoInstance.errors, view:'create'
            return
        }

        periodoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Periodo', 
												default: 'Periodo'
												), 
											periodoInstance.id])
                redirect periodoInstance
            }
            '*' { respond periodoInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Periodo periodoInstance) {
        if (periodoInstance == null) {
            notFound()
            return
        }

        if (periodoInstance.hasErrors()) {
            respond periodoInstance.errors, view:'edit'
            return
        }

        periodoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Periodo', 
												default: 'Periodo'), 
										periodoInstance.id])
                redirect periodoInstance
            }
            '*'{ respond periodoInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Periodo periodoInstance) {

        if (periodoInstance == null) {
            notFound()
            return
        }

        periodoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'periodo.deleted.message', args: [message(code: 'Periodo', default: 'Periodo'), periodoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
