package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ProfesorController {

    def index() {
    	params.max = 10
 		respond Profesor.list(params), model:[profesores: Profesor.list(params), profesorInstanceCount: Profesor.count()] 	
    }

    def show(Profesor profesorInstance){
    	respond profesorInstance    	
    }
    def create() {
        respond new Profesor(params)
    }

    def edit(Profesor profesorInstance) {
        respond profesorInstance
    }


    @Transactional
    def save(Profesor profesorInstance) {
        if (profesorInstance == null) {
            notFound()
            return
        }

        if (profesorInstance.hasErrors()) {
            respond profesorInstance.errors, view:'create'
            return
        }

        profesorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'profesor.label', 
												default: 'Profesor'
												), 
											profesorInstance.id])
                redirect profesorInstance
            }
            '*' { respond profesorInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Profesor profesorInstance) {
        if (profesorInstance == null) {
            notFound()
            return
        }

        if (profesorInstance.hasErrors()) {
            respond profesorInstance.errors, view:'edit'
            return
        }

        profesorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'profesor.label', 
												default: 'Profesor'), 
										profesorInstance.id])
                redirect profesorInstance
            }
            '*'{ respond profesorInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Profesor profesorInstance) {

        if (profesorInstance == null) {
            notFound()
            return
        }

        profesorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'profesor.deleted.message', args: [message(code: 'profesor.label', default: 'Profesor'), profesorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
