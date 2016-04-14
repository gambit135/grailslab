package lab

class Periodo {

	String periodo

    static constraints = {
    	periodo (blank : false, unique: true)
    }

    String toString(){
    	return this.periodo
    }
}
