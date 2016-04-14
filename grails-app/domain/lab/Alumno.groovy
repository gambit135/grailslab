package lab

class Alumno implements Comparable {

	String boleta
	String apPat
	String apMat
	String nombre

	//hasMany Inscripcion
	static hasMany = [inscripciones:Inscripcion]
		
    static constraints = {

    	boleta (blank:false, nullable:false,size:10..10, unique:true)
    	nombre(blank: false)
    	apPat(blank: false)
    	apMat(blank: false)
    }

     public int compareTo(java.lang.Object other) {

     	Alumno a2 = (Alumno)other  

        Integer b1 = this.boleta as Integer
        Integer b2 = a2.boleta as Integer

        return b1-b2
    }
    String toString(){
        return this?.apPat + " " + this?.apMat + " " +
        this?.nombre
    }



}
