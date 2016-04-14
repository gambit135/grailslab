package lab

class TuplaMaterial {
	Material material
	Adeudo adeudo
	Prestamo prestamo
	//static belongsTo = [prestamoEnTupla: Prestamo]
	
    static constraints = {
    	adeudo(blank: true, required: false, nullable: true)
    }

    String toString(){
    	return material.toString()
    }
}
