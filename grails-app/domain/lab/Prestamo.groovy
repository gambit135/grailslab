package lab
/**
	* Abstrae el concepto de la hoja de préstamo.
	* 
	*@author Alejandro Téllez <java.util.fck@hotmail.com>
*/
class Prestamo {

	//La sesión contiene la fecha en la que se realiza el prestamo
	Sesion sesion

	//Notas adicionales sobre la practica
	String notas

	//El alumno que deja la credencial	
	Inscripcion aval

	//Si el préstamo ha sido concluido, con o sin adeudo
	boolean concluido

	//Datos de los alumnos inscritos y de los materiales en préstamo
	static hasMany = [inscripciones:Inscripcion, tuplasMaterial:TuplaMaterial]
	

    static constraints = {
    	notas(blank:true, nullable: true)
    }

    String toString(){
    	return aval.toString() + " - " + sesion.toString()
    }
}
