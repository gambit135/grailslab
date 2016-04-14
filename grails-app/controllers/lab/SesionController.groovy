package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class SesionController {

    def index() {
        params.max = 10
        respond Sesion.list(params), model:[sesiones: Sesion.list(params), sesionInstanceCount: Sesion.count()]     
    }

    def show(Sesion sesionInstance){
        respond sesionInstance      
    }
    def create() {
        respond new Sesion(params)
    }

    def edit(Sesion sesionInstance) {
        respond sesionInstance
    }


    @Transactional
    def save(Sesion sesionInstance) {

        sesionInstance.fecha = new Date()
        sesionInstance.user = lab.User.findByName(session?.user?.name)

        
        if (sesionInstance == null) {
            notFound()
            return
        }       
        sesionInstance.save()
        
        //Guardar sesión de préstamo en HttpSession
        session.sesion = sesionInstance

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
                                        args: [
                                            message(
                                                code: 'sesion.label', 
                                                default: 'Sesion'
                                                ), 
                                            sesionInstance.id])
                redirect sesionInstance
            }
            '*' { respond sesionInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Sesion sesionInstance) {
        sesionInstance.fecha = new Date()
        sesionInstance.user = lab.User.findByName(session?.user?.name)
        if (sesionInstance == null) {
            notFound()
            return
        }

        if (sesionInstance.hasErrors()) {
            respond sesionInstance.errors, view:'edit'
            return
        }

        sesionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
                                        args: [message
                                                (code: 'sesion.label', 
                                                default: 'Sesion'), 
                                        sesionInstance.id])
                redirect sesionInstance
            }
            '*'{ respond sesionInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Sesion sesionInstance) {

        if (sesionInstance == null) {
            notFound()
            return
        }

        sesionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'sesion.deleted.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
