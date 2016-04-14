package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class AlumnoController {

    def index() {
    	params.max = 10
 		respond Alumno.list(params), model:[alumnos: Alumno.list(params), alumnoInstanceCount: Alumno.count()] 	
    }

    def show(Alumno alumnoInstance){
    	respond alumnoInstance    	
    }
    def create() {
        respond new Alumno(params)
    }

    def edit(Alumno alumnoInstance) {
        respond alumnoInstance
    }


    @Transactional
    def save(Alumno alumnoInstance) {
        if (alumnoInstance == null) {
            notFound()
            return
        }

        if (alumnoInstance.hasErrors()) {
            respond alumnoInstance.errors, view:'create'
            return
        }

        alumnoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Alumno', 
												default: 'Alumno'
												), 
											alumnoInstance.id])
                redirect alumnoInstance
            }
            '*' { respond alumnoInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Alumno alumnoInstance) {
        if (alumnoInstance == null) {
            notFound()
            return
        }

        if (alumnoInstance.hasErrors()) {
            respond alumnoInstance.errors, view:'edit'
            return
        }

        alumnoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Alumno', 
												default: 'Alumno'), 
										alumnoInstance.id])
                redirect alumnoInstance
            }
            '*'{ respond alumnoInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Alumno alumnoInstance) {

        if (alumnoInstance == null) {
            notFound()
            return
        }

        alumnoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'alumno.deleted.message', args: [message(code: 'Alumno', default: 'Alumno'), alumnoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
