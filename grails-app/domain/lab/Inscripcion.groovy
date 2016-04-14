package lab

class Inscripcion {

	Alumno alumno
	//InstanciaMateria instanciaMateria

    //hasMany Adeudos[X]
	//belongsTo Alumno
	static belongsTo = [instanciaMateria: InstanciaMateria]
	//static hasMany = [adeudo:Adeudo]
	//static belongsTo = [alumno:Alumno]
	
    static constraints = {
    }

    String toString(){
		return this?.instanciaMateria?.materia?.nombre + " " +
		this?.alumno?.boleta + " " +
		this?.alumno?.apPat + " " +
		this?.alumno?.apMat + " " +
		this?.alumno?.nombre
	}
}
