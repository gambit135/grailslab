package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class PrestamoController {

    def index() {
    	params.max = 15
 		respond Prestamo.findAllByConcluido(false), view: 'index', model:[prestamos: Prestamo.findAllByConcluido(false), prestamoInstanceCount: Prestamo.findAllByConcluido(false).size]
    }

    def show(Prestamo prestamoInstance){
        if(prestamoInstance?.concluido){
            if(prestamoInstance.concluido ==  true){
                this.showPrestamoConcluido(prestamoInstance)
                return
            }
            else{
                respond prestamoInstance
                return
            }
        }
        else{
            respond prestamoInstance
            return
        }
    }

    @Transactional
    def create() {
        if(!session?.sesion){
            def sesionInstance = new Sesion(fecha: new Date(), user: lab.User.findByName(session?.user?.name))
            sesionInstance.save flush:true
            session.sesion=sesionInstance
        }
        println "creando nueva instancia de Préstamo"
        respond new Prestamo(params)
    }

    def edit(Prestamo prestamoInstance) {
        respond prestamoInstance
    }

    @Transactional
    def save(Prestamo prestamoInstance) {
        if (prestamoInstance == null) {
            notFound()
            return
        }

        if (prestamoInstance.hasErrors()) {
            respond prestamoInstance.errors, view:'create'
            return
        }

        prestamoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'prestamo.label', 
												default: 'Prestamo'
												), 
											prestamoInstance.id])
                redirect action: 'registrarAlumnos', id: prestamoInstance.id
            }
            '*' { redirect action: 'registrarAlumnos', id: prestamoInstance.id }
        }
    }

    @Transactional
    def update(Prestamo prestamoInstance) {
        if (prestamoInstance == null) {
            notFound()
            return
        }

        if (prestamoInstance.hasErrors()) {
            respond prestamoInstance.errors, view:'edit'
            return
        }

        prestamoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'prestamo.label', 
												default: 'Prestamo'), 
										prestamoInstance.id])
                redirect prestamoInstance
            }
            '*'{ respond prestamoInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Prestamo prestamoInstance) {

        if (prestamoInstance == null) {
            notFound()
            return
        }

        prestamoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Préstamo eliminado"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def seleccionarAval(){
        //Crear nuevo PrestamoInstance
        if(!session?.sesion){
            def sesionInstance = new Sesion(fecha: new Date(), user: lab.User.findByName(session?.user?.name))
            sesionInstance.save()
            session.sesion=sesionInstance
        }
        println "creando nueva instancia de Préstamo"
        respond new Prestamo(params)
    }   

    @Transactional    
    def agregarAvalPorRadio(Prestamo prestamoInstance){
        //Validate that radioValue is not null
        if (params.seleccionRadio){
            def sesionInstance
            if(!session?.sesion){
                sesionInstance = new Sesion(fecha: new Date(), user: lab.User.findByName(session?.user?.name))
                sesionInstance.save()
                session.sesion=sesionInstance
            }
            else{
                sesionInstance = session.sesion
            }

            println "seleccionRadio: " + params.seleccionRadio
            //Assign aval and save
            def aval = lab.Inscripcion.get(params.seleccionRadio.toInteger())
            prestamoInstance.aval = aval
            println "Aval: " + prestamoInstance.aval
            prestamoInstance.sesion = sesionInstance
            prestamoInstance.save()
            println "prestamoInstance saved!"
            redirect action: 'registrarAlumnos', id: prestamoInstance.id
        }
        else{
            //Don't Save and return to page
            println "Aval no válido"
            flash.message = "Aval no válido"
            redirect action: 'seleccionarAval'
        }
    }

    def registrarAlumnos(Prestamo prestamoInstance){
        if (!prestamoInstance){
            prestamoInstance = Prestamo.get(params.id)
        }
        respond prestamoInstance
    }

    @Transactional
    def agregarAlumnoAPrestamo(Prestamo prestamoInstance){

        println "Inscripcion: " + params.alumno
        def inscripcion = Inscripcion.get(params.alumno.toInteger())
        prestamoInstance?.inscripciones.add(inscripcion)
        prestamoInstance.save()

        String accion = params.accion


        println "Inscripciones: "
        prestamoInstance?.inscripciones.each{
            println "I: " + it
        }

        //Redirigir de nuevo a la pantalla de prestamo-RegistrarAlumnos
        //respond prestamoInstance, view: 'registrarAlumnos'
        //redirect action: 'registrarAlumnos', id: prestamoInstance.id
        redirect action: accion, id: prestamoInstance.id
    }

    @Transactional
    def eliminarAlumnoDePrestamo(){
        def inscripcion = Inscripcion.get(params.inscripcion.toInteger())
        def prestamoInstance = Prestamo.get(params.prestamoInstance.toInteger())
        prestamoInstance?.inscripciones.remove(inscripcion)
        prestamoInstance.save flush:true
        String accion = params.accion

        //Redirigir de nuevo a la pantalla de prestamo-RegistrarAlumnos
        //respond prestamoInstance, view: 'registrarAlumnos'
        //redirect action:"registrarAlumnos", id: prestamoInstance.id
        redirect action: accion, id: prestamoInstance.id
    }

    def registrarTuplasMaterial(Prestamo prestamoInstance){
        if (!prestamoInstance){
            prestamoInstance = Prestamo.get(params.prestamoInstance)
        }
        respond prestamoInstance
    }

    @Transactional
    def agregarTuplaMaterial(Prestamo prestamoInstance){

        String accion = params.accion

        println "Material: " + params.comboMateriales
        def material
        try{
            material = Material.get(params.comboMateriales.toInteger())
        }catch(Exception e){
            //respond prestamoInstance, view: 'registrarTuplasMaterial'
            redirect action: accion, id: prestamoInstance.id
            return
        }

        def tupla= new TuplaMaterial()
        tupla.material = material
        tupla.prestamo = prestamoInstance

        boolean existe = false

        for(TuplaMaterial t : prestamoInstance?.tuplasMaterial){
            if(t.material.id == tupla.material.id){
                existe = true
                break
            }
        }     

        if(!existe){
            prestamoInstance?.tuplasMaterial.add(tupla)
            prestamoInstance.save()
        }

        println "Tuplas: "
        prestamoInstance?.tuplasMaterial.each{
            println "T: " + it
        }
        
        //Redirigir de nuevo a la pantalla de prestamo-RegistrarTuplas
        //respond prestamoInstance, view: 'registrarTuplasMaterial'
        //redirect action: 'registrarTuplasMaterial', id: prestamoInstance.id
        redirect action: accion, id: prestamoInstance.id
    }

    @Transactional
    def agregarTuplaMaterialPorRadio(Prestamo prestamoInstance){

        //if(!prestamoInstance){
            println "no object instance!"
            println "seleccionRadio: " + params.seleccionRadio

            println "getting from params: " + params?.prestamoInstance
            prestamoInstance = Prestamo.get(params.prestamoInstance)
        //}

        String accion = params.accion
        def material = lab.Material.get(params.seleccionRadio.toInteger())
        println material

        def tupla= new TuplaMaterial()
        tupla.material = material
        tupla.prestamo = prestamoInstance

        boolean existe = false

        for(TuplaMaterial t : prestamoInstance?.tuplasMaterial){
            if(t.material?.id == tupla.material?.id){
                existe = true
                break
            }
        }     

        if(!existe){
            prestamoInstance?.tuplasMaterial.add(tupla)
            prestamoInstance.save()
        }

        println "Tuplas: "
        /*prestamoInstance?.tuplasMaterial?.each{
            println "T: " + it?.toString()
        }*/

        redirect action: accion, id: prestamoInstance?.id
    }
    @Transactional
    def atmpr(Prestamo prestamoInstance){
        //Store Keys
        Collection<?> keys = params.keySet()
        
        //Iterate them
        for (Object key : keys) {
            //check if key=action and key=controller which is grails default params
            //if (!key.equals("action") && !key.equals("controller")) {
                println " "
                println "\nKey: " + key //print out params-name
                println "Value: " + params.get(key) //print out params-value
            //}
        }
        
        String accion = params.accion

        if (!(params.seleccionRadio != null && params.seleccionRadio.toInteger() > 0)){
            redirect action: accion, id: prestamoInstance?.id            
        }
        
        def material = lab.Material.get(params.seleccionRadio.toInteger())
        println "material: " + material
        prestamoInstance = Prestamo.get(params.prestamoInstance)
        println "préstamo: " + prestamoInstance
        
        def tupla= new TuplaMaterial()
        tupla.material = material
        tupla.prestamo = prestamoInstance

        boolean existe = false

        for(TuplaMaterial t : prestamoInstance?.tuplasMaterial){
            if(t.material?.id == tupla.material?.id){
                existe = true
                break
            }
        }     

        if(!existe){
            prestamoInstance?.tuplasMaterial.add(tupla)
            prestamoInstance.save()
        }
        

        redirect action: accion, id: prestamoInstance?.id
    }

    @Transactional
    def eliminarTuplaDePrestamo(){
        def tpm = TuplaMaterial.get(params.tuplaMaterial.toInteger())
        def prestamoInstance = Prestamo.get(params.prestamoInstance.toInteger())
        String accion = params.accion
        println "accion: " + accion
        //prestamoInstance.removeFromTuplasMaterial(tpm)
        prestamoInstance?.tuplasMaterial.remove(tpm)
        tpm.delete()
        prestamoInstance.save flush:true

         //Redirigir de nuevo a la pantalla de prestamo-RegistrarTuplasMaterial
        redirect action: accion, id: prestamoInstance.id, params: [buscarPor: 'codigo']
    }

    def verAlumnos(Prestamo prestamoInstance){
        if (!prestamoInstance){
            prestamoInstance = Prestamo.get(params.id)
        }
        respond prestamoInstance
    }

    def verMateriales(Prestamo prestamoInstance){
        if (!prestamoInstance){
            prestamoInstance = Prestamo.get(params.id)
        }
        respond prestamoInstance
    }

    def concluirPrestamo(Prestamo prestamoInstance){
        respond prestamoInstance
    }

    @Transactional
    def crearAdeudos(Prestamo prestamoInstance){
        if(params?.list('tuplaId')?.size()>0) {
            println "inside IF1"
            //Checkboxes
            def tuplasIds = params.list('tuplaId').get(0)

            tuplasIds.each() { tupla ->
                if (tupla.key.isLong() && "on".equals(tupla.value)) {
                    //def post = BlogPost.get(postId.key.toLong())
                    println "inside IF2"
                    def adeudo = new Adeudo()
                    TuplaMaterial tpm = TuplaMaterial.get(tupla.key.toInteger())
                    println "tpm.id: " + tpm.id
                    println "tpm.material: " + tpm?.material.nombre + " " + tpm?.material.tipoMaterial.tipo
                    adeudo.tuplaMaterial = tpm
                    adeudo.concepto = " "
                    adeudo.descripcion = " "
                    adeudo.saldado = false
                    adeudo.save()
                    tpm.adeudo = adeudo
                    tpm.save()
                }
            }
        }
        else{
            println "else1"
        }
        /*
        println "All Adeudos:"
        lab.Adeudo.list().each(){
            adeudo->
            println "id: " + adeudo?.id
            println "material: " + adeudo?.tuplaMaterial?.material?.nombre
            println "saldado: " + adeudo?.saldado
        }
*/
        prestamoInstance.concluido = true
        prestamoInstance.save flush: true

        redirect action: "showPrestamoConcluido", id: prestamoInstance.id
    }

    def prestamosConcluidos(){
        params.max = 15
        respond Prestamo.findAllByConcluido(true), view: 'prestamosConcluidos', model:[prestamos: Prestamo.findAllByConcluido(true), prestamoInstanceCount: Prestamo.findAllByConcluido(true).size]
    }

    def showPrestamoConcluido(Prestamo prestamoInstance){
        if (!prestamoInstance){
            prestamoInstance = Prestamo.get(params.id)
        }
        respond prestamoInstance 
    }

    def busquedaDeMaterialPor(Prestamo prestamoInstance){

        //Read action to know where you are
        String accion = params.accion
        //Read searchBy
        String buscarPor = params.buscarPor

        println "Acción: " + accion
        println "Buscar por: " + buscarPor
        
        redirect action: accion, id: prestamoInstance.id, params: [buscarPor: buscarPor]
    }

    def busquedaDeAvalPor(){

        //Read action to know where you are
        String accion = params.accion
        String criterio = params.criterio
        String buscando = params.buscando
        String materia = params?.materia
        String periodo = params?.periodo
        //Read searchBy
        //String buscarPor = params.buscarPor

        println "Acción: " + accion        
        
        redirect action: accion, params: [criterio: criterio, buscando: buscando, periodo: periodo, materia: materia]
        //redirect(action: "show", id: 4, params: [author: "Stephen King"])
    }


    def buscar(Prestamo prestamoInstance){

        String buscarPor = params.buscarPor
        String accion = params.accion
        String criterio = params.criterio
        String buscando = params.buscando

        println "criterio: " + criterio

        redirect action: accion, id: prestamoInstance.id, params: [buscarPor: buscarPor, criterio: params.criterio, buscando: buscando]
    }
}
