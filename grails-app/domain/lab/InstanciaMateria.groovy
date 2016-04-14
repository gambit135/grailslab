package lab

import org.apache.commons.collections.list.LazyList;

class InstanciaMateria {

    //Object attributes
    Profesor titular
   	Profesor auxiliar
   	Materia materia
    Periodo periodo

    //Horario
    String diaDeLaSemana
    String hora
    //String periodo
    String grupo
    List inscripciones = new ArrayList()

    //Inscripciones a esta instanciaMateria
    static hasMany = [inscripciones:Inscripcion]
	
    static constraints = {
        hora(nullable: true, blank:true, required: false)
    }
    
    String toString(){
        return this?.grupo + " - " + 
        this?.materia?.nombre + " - " + 
        this?.titular?.apPat + " " + 
        this?.titular?.apMat + " " +
        this?.titular?.nombre
    }
}
