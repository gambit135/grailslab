package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class MateriaController {

    def index() {
    	params.max = 10
 		respond Materia.list(params), model:[materias: Materia.list(params), materiaInstanceCount: Materia.count()] 	
    }

    def show(Materia materiaInstance){
    	respond materiaInstance    	
    }
    def create() {
        respond new Materia(params)
    }

    def edit(Materia materiaInstance) {
        respond materiaInstance
    }


    @Transactional
    def save(Materia materiaInstance) {
        if (materiaInstance == null) {
            notFound()
            return
        }

        if (materiaInstance.hasErrors()) {
            respond materiaInstance.errors, view:'create'
            return
        }

        materiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'materia.label', 
												default: 'Materia'
												), 
											materiaInstance.id])
                redirect materiaInstance
            }
            '*' { respond materiaInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Materia materiaInstance) {
        if (materiaInstance == null) {
            notFound()
            return
        }

        if (materiaInstance.hasErrors()) {
            respond materiaInstance.errors, view:'edit'
            return
        }

        materiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'materia.label', 
												default: 'Materia'), 
										materiaInstance.id])
                redirect materiaInstance
            }
            '*'{ respond materiaInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Materia materiaInstance) {

        if (materiaInstance == null) {
            notFound()
            return
        }

        materiaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'materia.deleted.message', args: [message(code: 'materia.label', default: 'Materia'), materiaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
