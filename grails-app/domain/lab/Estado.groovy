package lab

class Estado {

    String nombre
	String descripcion

    static constraints = {
    	descripcion	(blank:true, required: false)
    }
    String toString(){
    	return this?.nombre
    }
}
