package lab

class TipoMaterial {

	String tipo
	String descripcion

    static constraints = {
    }
    String toString(){
    	return this?.tipo
    }
}
