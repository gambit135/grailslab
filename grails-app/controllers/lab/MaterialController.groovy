package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class MaterialController {

    def index() {
    	params.max = 10
 		respond Material.list(params), model:[materiales: Material.list(params), materialInstanceCount: Material.count()] 	
    }

    def show(Material materialInstance){
    	respond materialInstance    	
    }
    def create() {
        respond new Material(params)
    }

    def edit(Material materialInstance) {
        respond materialInstance
    }


    @Transactional
    def save(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if (materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'create'
            return
        }

        materialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Material', 
												default: 'Material'
												), 
											materialInstance.id])
                redirect materialInstance
            }
            '*' { respond materialInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if (materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'edit'
            return
        }

        materialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Material', 
												default: 'Material'), 
										materialInstance.id])
                redirect materialInstance
            }
            '*'{ respond materialInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Material materialInstance) {

        if (materialInstance == null) {
            notFound()
            return
        }

        materialInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'material.deleted.message', args: [message(code: 'Material', default: 'Material'), materialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def cargarTiposMaterial = {
        println "cargarTiposMaterial @MaterialController"

        //Un estado determinado pasado como parámetro
        def estado = Estado.get(params.estado.id.toInteger())
        
        //Todos los materiales en un estado determinado
        def materiales = Material.findAllByEstado(estado)

        //Lista de distintos tipos de materiales en un estado
        List tiposMaterial = new ArrayList()

        //Recorrer los materiales en un estado para obtener sus distintos tipos
        materiales.each{
            if(!tiposMaterial.contains(it.tipoMaterial)){
                tiposMaterial.add(it.tipoMaterial)
            }
        }

        //Actualizar combo de tipos de material
        render(template: '/prestamo/templates/comboTiposMaterial', model:[tiposMaterial: tiposMaterial])

    }

    def cargarMateriales={
        println "cargarMateriales @ MaterialController"

        //Un estado determinado pasado como parámetro
        def estado = Estado.get(params.estado.id.toInteger())

        //Un tipo de material determinado pasado como parámetro
        def tipoMaterial = TipoMaterial.get(params.tipoMaterial.id.toInteger())

        //Materiales en un estado y de un tipo específicos
        def materiales = Material.findAllByEstadoAndTipoMaterial(estado, tipoMaterial, [sort: "nombre"])


        materiales.removeAll{

            boolean quita1 = false
            
            //Sólo pueden cargarse materiales que no existan ya en otro préstamo inconcluso

            //Todos los préstamos sin concluir
            for (Prestamo p1: Prestamo.findAllfindAllByConcluido(false)){
                //Para cada tupla del préstamo
                for (TuplaMaterial t1 : p1?.tuplasMaterial){
                    //Si el material "it" en curso es igual al asignado en la tupla
                    if(t1?.material?.id == it?.id){
                        quita1 = true
                        println "El material se encuentra en otro préstamo"
                        break;
                    }                    
                }
                if (quita1){
                    break;
                }
            }            
            
            //Y sólo pueden cargarse materiales que no estén adeudados
            //Si no está en un préstamo actual, puede estar adeudado
            if (!quita1){
                //Todos los adeudos no saldados
                for (Adeudo a1 : Adeudo.findAllBySaldado(false)){
                    if(a1?.tuplaMaterial?.material?.id == it?.id){
                        println "El material se encuentra adeudado"
                        quita1 = true
                        break;
                    }
                }
            }
            quita1            
        }        

        //Actualizar combo de materiales
        render(template: '/prestamo/templates/comboMateriales', model: [materiales: materiales])
    }

    def buscarPorCodigo(String codigo){

        println "buscarPorCodigo@MaterialController"
        println "codigo: " + codigo

        def lista
        lista = lab.Material.findAllByCodigoLike("%"+codigo+"%")

        
        lista.removeAll{
            boolean quita1 = false
            
            //Sólo pueden cargarse materiales que no existan ya en otro préstamo inconcluso

            //Todos los préstamos sin concluir
            for (Prestamo p1: Prestamo.findAllfindAllByConcluido(false)){
                //Para cada tupla del préstamo
                for (TuplaMaterial t1 : p1?.tuplasMaterial){
                    //Si el material "it" en curso es igual al asignado en la tupla
                    if(t1?.material?.id == it?.id){
                        quita1 = true
                        println "El material se encuentra en otro préstamo"
                        break;
                    }                    
                }
                if (quita1){
                    break;
                }
            }            
            
            //Y sólo pueden cargarse materiales que no estén adeudados
            //Si no está en un préstamo actual, puede estar adeudado
            if (!quita1){
                //Todos los adeudos no saldados
                for (Adeudo a1 : Adeudo.findAllBySaldado(false)){
                    if(a1?.tuplaMaterial?.material?.id == it?.id){
                        println "El material se encuentra adeudado"
                        quita1 = true
                        break;
                    }
                }
            }
            quita1            
        }

        return lista
    }
    def buscarPorNombre(String nombre){
        def lista
        lista = Material.findAllByNombreLike("%"+nombre+"%", [sort: "nombre"])
        lista.removeAll{
            boolean quita1 = false
            
            //Sólo pueden cargarse materiales que no existan ya en otro préstamo inconcluso

            //Todos los préstamos sin concluir
            for (Prestamo p1: Prestamo.findAllfindAllByConcluido(false)){
                //Para cada tupla del préstamo
                for (TuplaMaterial t1 : p1?.tuplasMaterial){
                    //Si el material "it" en curso es igual al asignado en la tupla
                    if(t1?.material?.id == it?.id){
                        quita1 = true
                        println "El material se encuentra en otro préstamo"
                        break;
                    }                    
                }
                if (quita1){
                    break;
                }
            }            
            
            //Y sólo pueden cargarse materiales que no estén adeudados
            //Si no está en un préstamo actual, puede estar adeudado
            if (!quita1){
                //Todos los adeudos no saldados
                for (Adeudo a1 : Adeudo.findAllBySaldado(false)){
                    if(a1?.tuplaMaterial?.material?.id == it?.id){
                        println "El material se encuentra adeudado"
                        quita1 = true
                        break;
                    }
                }
            }
            quita1            
        }

        return lista
    }

    def buscarPorTipo(String tipo){
        List<Material> lista = new LinkedList<Material>()
        
        //more complicated
        //First, find all TipoMaterial By their tipo
        def tipos = TipoMaterial.findAllByTipoLike("%"+tipo+"%")

        //Then search each material that exists for each tipo found

        println "Tipos"
        for(TipoMaterial t : tipos){
            println t
        }

        //For each tipomaterial found
        for(TipoMaterial t : tipos){
            //Find all materiales that have that tipo
            def materiales = Material.findAllByTipoMaterial(t)
            println "Materiales"
             for(Material m : materiales){
                println m
                lista.add(m)
            }
        }

        //Then, remove
        lista.removeAll{
            boolean quita1 = false
            
            //Sólo pueden cargarse materiales que no existan ya en otro préstamo inconcluso

            //Todos los préstamos sin concluir
            for (Prestamo p1: Prestamo.findAllfindAllByConcluido(false)){
                //Para cada tupla del préstamo
                for (TuplaMaterial t1 : p1?.tuplasMaterial){
                    //Si el material "it" en curso es igual al asignado en la tupla
                    if(t1?.material?.id == it?.id){
                        quita1 = true
                        println "El material se encuentra en otro préstamo"
                        break;
                    }                    
                }
                if (quita1){
                    break;
                }
            }            
            
            //Y sólo pueden cargarse materiales que no estén adeudados
            //Si no está en un préstamo actual, puede estar adeudado
            if (!quita1){
                //Todos los adeudos no saldados
                for (Adeudo a1 : Adeudo.findAllBySaldado(false)){
                    if(a1?.tuplaMaterial?.material?.id == it?.id){
                        println "El material se encuentra adeudado"
                        quita1 = true
                        break;
                    }
                }
            }
            quita1            
        }

        lista.sort{it.tipoMaterial}

        return lista        
    }

}
