package lab

class Sesion {
	Date fecha
	User user
    static constraints = {
    	fecha(blank:true, required:false, nullable: true)
    	user(blank:true, required:false, nullable: true)
    }
}
