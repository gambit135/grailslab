package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class InscripcionController {

    def index() {
    	params.max = 10
 		respond Inscripcion.list(params), model:[inscripciones: Inscripcion.list(params), inscripcionInstanceCount: Inscripcion.count()] 	
    }

    def show(Inscripcion inscripcionInstance){
    	respond inscripcionInstance    	
    }
    def create() {
        respond new Inscripcion(params)
    }

    def edit(Inscripcion inscripcionInstance) {
        respond inscripcionInstance
    }


    @Transactional
    def save(Inscripcion inscripcionInstance) {
        if (inscripcionInstance == null) {
            notFound()
            return
        }

        if (inscripcionInstance.hasErrors()) {
            respond inscripcionInstance.errors, view:'create'
            return
        }

        def instanciaMateria = InstanciaMateria.findById(inscripcionInstance.instanciaMateria.id)
        instanciaMateria.inscripciones.add(inscripcionInstance)
        inscripcionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'Inscripción', 
												default: 'Inscripcion'
												), 
											inscripcionInstance.id])
                redirect inscripcionInstance
            }
            '*' { respond inscripcionInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Inscripcion inscripcionInstance) {
        if (inscripcionInstance == null) {
            notFound()
            return
        }

        if (inscripcionInstance.hasErrors()) {
            respond inscripcionInstance.errors, view:'edit'
            return
        }

        inscripcionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'Inscripción', 
												default: 'Inscripcion'), 
										inscripcionInstance.id])
                redirect inscripcionInstance
            }
            '*'{ respond inscripcionInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Inscripcion inscripcionInstance) {

        if (inscripcionInstance == null) {
            notFound()
            return
        }

        inscripcionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'inscripcion.deleted.message', args: [message(code: 'Inscripción', default: 'Inscripcion'), inscripcionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    /**
    * Cargar inscripciones por periodo
    */
    def cargarInscripcionesPorPeriodo = {
        println "on cargarInscripcionesPorPeriodo"
        
        //Para el periodo seleccionado
        def periodo = lab.Periodo.get(params.periodo.id)

        println periodo

        //Cargar las instancias de materias correspondientes
        def instancias = lab.InstanciaMateria.findAllByPeriodo(periodo)

        render(template: '/prestamo/templates/instanciasMaterias', model:  [instancias: instancias])
    }
    /**
    *   Carga alumnos candidatos a avales
    */
    def cargarAlumnosParaInstanciaMateria = {
        println "on cargarAlumnosParaInstanciaMateria InscripcionController"
        def instanciaMateria = InstanciaMateria.get(params.instanciaMateria.id)
        def listaInscripciones = Inscripcion.findAllByInstanciaMateria(instanciaMateria, [sort: "alumno.apPat"])

        //Quitar los que ya existen en otro préstamo inconcluso
        //Tanto como avales, como parte del equipo

        //Obtener préstamos inconclusos
        def prestamosInconclusos =  lab.Prestamo.findAllByConcluido(false)
        //Quitar los que no sean del mismo grupo que el seleccionado
        prestamosInconclusos.removeAll{
            it?.aval?.instanciaMateria?.id != instanciaMateria?.id
        }

        //Obtener adeudos no saldados
        def adeudosNoSaldados = lab.Adeudo.findAllBySaldado(false)
        //Eliminar todos los que no sean del mismo grupo que el seleccionado
        adeudosNoSaldados.removeAll{
            it?.tuplaMaterial?.prestamo?.aval?.instanciaMateria?.id != instanciaMateria?.id
        }
        
        listaInscripciones.removeAll{
            boolean quita = false

            //Buscar en los préstamos inconclusos
            for(def p1 : prestamosInconclusos){
                //Si se es el aval de un préstamo inconcluso
                if(it.alumno?.boleta == p1?.aval?.alumno?.boleta){
                    quita = true
                    break
                }
                //Si se pertenece a un préstamo inconcluso
                if(p1?.inscripciones?.contains(it)){
                   quita = true
                   break
                }
            }
            if(!quita){
                //Buscar en adeudos no saldados
                for(def a1 : adeudosNoSaldados){
                    //Si el alumno es aval de un préstamo no saldado
                    if(a1?.tuplaMaterial?.prestamo?.aval?.alumno?.boleta == it?.alumno?.boleta){
                        quita = true
                        break
                    }
                }
            }
            quita
        }
        render(template: '/prestamo/templates/aval', model:  [inscripciones: listaInscripciones])
        //render(template: '/prestamo/templates/comboAlumnos', model:  [inscripciones: lab.Inscripcion.list()])
    }

    
    def buscarPorBoleta(String boleta, String instanciaId){

        println "buscarPorBoleta@InscripcionController"
        println "instanciaMateria.ID: " + instanciaId
        int asdf = Integer.parseInt(instanciaId)
        println "parsed id: " + asdf 

        def instancia = InstanciaMateria.findById(asdf)
        //int instancia = instancia1

        println "boleta: " + boleta
        println "materia: " + instancia

        def alumnos = lab.Alumno.findAllByBoletaLike("%"+boleta+"%", [sort: "boleta"])

        //Find all inscripciones for alumnos that match the instanciaMateria criteria
        def inscripciones = Inscripcion.findAllByInstanciaMateria(instancia, [sort: "alumno.apPat"])

        def candidatos = new LinkedList<Inscripcion>()

        //iterate all inscripciones to see if they match each of the alumnos found

        for (Alumno a : alumnos){
            for (Inscripcion i : inscripciones){
                if (a == i.alumno){
                    candidatos.add(i)
                    break
                }
            }
        }        
         //Quitar los que ya existen en otro préstamo inconcluso
        //Tanto como avales, como parte del equipo

        //Obtener préstamos inconclusos
        def prestamosInconclusos =  lab.Prestamo.findAllByConcluido(false)
        //Quitar los que no sean del mismo grupo que el seleccionado
        //(Sólo nos interesa la instanciaMateria en cuestión)
        prestamosInconclusos.removeAll{
            println "aval en prestamo inconcluso: " + it?.aval
            it?.aval?.instanciaMateria?.id != instancia?.id
        }

        //Obtener adeudos no saldados
        def adeudosNoSaldados = lab.Adeudo.findAllBySaldado(false)
        //Eliminar todos los que no sean del mismo grupo que el seleccionado
        //(Sólo nos interesa la instanciaMateria en cuestión)
        adeudosNoSaldados.removeAll{
            it?.tuplaMaterial?.prestamo?.aval?.instanciaMateria?.id != instancia?.id
        }
        
        candidatos.removeAll{
            boolean quita = false

            //Buscar en los préstamos inconclusos
            for(def p1 : prestamosInconclusos){
                //Si se es el aval de un préstamo inconcluso
                if(it.alumno?.boleta == p1?.aval?.alumno?.boleta){
                    quita = true
                    break
                }
                //Si se pertenece a un préstamo inconcluso
                if(p1?.inscripciones?.contains(it)){
                   quita = true
                   break
                }
            }
            if(!quita){
                //Buscar en adeudos no saldados
                for(def a1 : adeudosNoSaldados){
                    //Si el alumno es aval de un préstamo no saldado
                    if(a1?.tuplaMaterial?.prestamo?.aval?.alumno?.boleta == it?.alumno?.boleta){
                        quita = true
                        break
                    }
                }
            }
            quita
        }
        candidatos.sort{
            it?.alumno?.boleta
        }
        return candidatos
    }

}
