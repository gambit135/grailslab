package lab

class Profesor {

    //String idProfesor
	String apPat
	String apMat
	String nombre

	//hasMany InstanciaMateria [X]
	//static hasMany = [materias:InstanciaMateria]
	
	
    static constraints = {
    	nombre(blank: false)
    	apPat(blank: false)
    	apMat(blank: false)
    }
}
