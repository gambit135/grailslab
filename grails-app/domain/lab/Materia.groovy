package lab

class Materia {

	String nombre
	int nivel

    static constraints = {
    	nombre (blank: false, unique:true)
    }

    String toString(){
		return this.nombre
	}
}
