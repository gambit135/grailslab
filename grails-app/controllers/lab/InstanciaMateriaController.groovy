package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class InstanciaMateriaController {

    def index() {
    	params.max = 10
 		respond InstanciaMateria.list(params), model:[instanciaMaterias: InstanciaMateria.list(params), instanciaMateriaInstanceCount: InstanciaMateria.count()] 	
    }

    def show(InstanciaMateria instanciaMateriaInstance){
    	respond instanciaMateriaInstance    	
    }
    def create() {
        respond new InstanciaMateria(params)
    }

    def edit(InstanciaMateria instanciaMateriaInstance) {
        respond instanciaMateriaInstance
    }


    @Transactional
    def save(InstanciaMateria instanciaMateriaInstance) {
        if (instanciaMateriaInstance == null) {
            notFound()
            return
        }

        if (instanciaMateriaInstance.hasErrors()) {
            respond instanciaMateriaInstance.errors, view:'create'
            return
        }

        instanciaMateriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Instancia de Materia', 
												default: 'InstanciaMateria'
												), 
											instanciaMateriaInstance.id])
                redirect instanciaMateriaInstance
            }
            '*' { respond instanciaMateriaInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(InstanciaMateria instanciaMateriaInstance) {
        if (instanciaMateriaInstance == null) {
            notFound()
            return
        }

        if (instanciaMateriaInstance.hasErrors()) {
            respond instanciaMateriaInstance.errors, view:'edit'
            return
        }

        instanciaMateriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Instancia de Materia', 
												default: 'InstanciaMateria'), 
										instanciaMateriaInstance.id])
                redirect instanciaMateriaInstance
            }
            '*'{ respond instanciaMateriaInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(InstanciaMateria instanciaMateriaInstance) {

        if (instanciaMateriaInstance == null) {
            notFound()
            return
        }

        instanciaMateriaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'instanciaMateria.deleted.message', args: [message(code: 'Instancia de Materia', default: 'InstanciaMateria'), instanciaMateriaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
