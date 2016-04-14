package lab

class Adeudo {

	//Un adeudo se existe debido al daño de un material prestado
	TuplaMaterial tuplaMaterial

	//Concepto del adeudo
    String concepto

    //Información adicional
    String descripcion
    
    //Indica si ya fue saldado el adeudo
    boolean saldado

    static constraints = {
        concepto(blank: true, nullable: true)
        descripcion(blank: true, nullable: true)
    }

    String toString(){
        String stat = "Pendiente"
        if (this?.saldado == true){
            stat = "Saldado"
        }
        return stat + ": " + this.tuplaMaterial.toString()
    }
}
