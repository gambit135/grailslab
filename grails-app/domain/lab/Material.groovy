package lab

class Material {

	//el nombre corto compuesto por letras y números
	String nombre

	//El código del código de barras
	String codigo

	//El material se encuentra siempre en un estado
	Estado estado

	//El tipo de material (e.g., multimetro, generador, etc)
	TipoMaterial tipoMaterial

    static constraints = {
    	codigo (unique: true)
    	nombre (unique: true)
    }
    
    String toString(){
    	return this?.nombre + " " +     	
    	"(" + this?.codigo + ") " + 
    	this?.tipoMaterial?.tipo + " " +
    	"(" + 
    	this?.estado?.nombre + ")"
    }
}
