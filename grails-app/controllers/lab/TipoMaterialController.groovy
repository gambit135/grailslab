package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class TipoMaterialController {

    def index() {
    	params.max = 10
 		respond TipoMaterial.list(params), model:[tiposMaterial: TipoMaterial.list(params), tipoMaterialInstanceCount: TipoMaterial.count()] 	
    }

    def show(TipoMaterial tipoMaterialInstance){
    	respond tipoMaterialInstance    	
    }
    def create() {
        respond new TipoMaterial(params)
    }

    def edit(TipoMaterial tipoMaterialInstance) {
        respond tipoMaterialInstance
    }


    @Transactional
    def save(TipoMaterial tipoMaterialInstance) {
        if (tipoMaterialInstance == null) {
            notFound()
            return
        }

        if (tipoMaterialInstance.hasErrors()) {
            respond tipoMaterialInstance.errors, view:'create'
            return
        }

        tipoMaterialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Tipo de Material', 
												default: 'TipoMaterial'
												), 
											tipoMaterialInstance.id])
                redirect tipoMaterialInstance
            }
            '*' { respond tipoMaterialInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(TipoMaterial tipoMaterialInstance) {
        if (tipoMaterialInstance == null) {
            notFound()
            return
        }

        if (tipoMaterialInstance.hasErrors()) {
            respond tipoMaterialInstance.errors, view:'edit'
            return
        }

        tipoMaterialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Tipo de Material', 
												default: 'TipoMaterial'), 
										tipoMaterialInstance.id])
                redirect tipoMaterialInstance
            }
            '*'{ respond tipoMaterialInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(TipoMaterial tipoMaterialInstance) {

        if (tipoMaterialInstance == null) {
            notFound()
            return
        }

        tipoMaterialInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'tipoMaterial.deleted.message', args: [message(code: 'Tipo de Material', default: 'TipoMaterial'), tipoMaterialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}
