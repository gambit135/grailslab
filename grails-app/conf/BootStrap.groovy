import lab.*

class BootStrap {

    def init = { servletContext ->

    	def user = new User(name: "admin", password: "admin")
        user.save()

    	//Alumnos
    	def alumno1 = new Alumno(boleta: "2009630494", nombre: "Alejandro", apPat: "Téllez", apMat: "Gaña")
    	alumno1.save()
    	def alumno2 = new Alumno(boleta: "2009630533", nombre: "Angélica", apPat: "Díaz", apMat: "Roldán")
    	alumno2.save()
    	def alumno3 = new Alumno(boleta: "2009630353", nombre: "Christian Iván", apPat: "Cuenca", apMat: "Castillo")
    	alumno3.save()
    	def alumno4 = new Alumno(boleta: "2009630547", nombre: "Gerardo", apPat: "Lima", apMat: "Rangel")
    	alumno4.save()

    	//Materias abstractas
    	def materia1 = new Materia(nombre: "Electrónica Analógica", nivel: 2)
    	materia1.save()
    	def materia2 = new Materia(nombre: "Análisis Fundamental de Circuitos", nivel: 1)
    	materia2.save()
    	def materia3 = new Materia(nombre: "Instrumentación", nivel: 3)
    	materia3.save()

    	//Profesores
    	def profesor1 = new Profesor(nombre: "Sergio", apPat: "Cancino", apMat: "Calderón")
    	profesor1.save()
    	
    	def profesor2 = new Profesor(nombre: "Rocío", apPat: "Almazán", apMat: "Farfán")
    	profesor2.save()
    	
    	def profesor3 = new Profesor(nombre: "Juan Carlos", apPat: "Téllez", apMat: "Barrera")
    	profesor3.save()
    	
    	def profesor4 = new Profesor(nombre: "María del Rosario", apPat: "Rocha", apMat: "Bernabe")
    	profesor4.save()
    	
    	def profesor5 = new Profesor(nombre: "Raúl", apPat: "Santillán", apMat: "Luna")
    	profesor5.save()
    	
    	def profesor6 = new Profesor(nombre: "Felipe de Jesús", apPat: "Figueroa", apMat: "Del Prado")
    	profesor6.save()
    	
    	def profesor7 = new Profesor(nombre: "José Alfredo", apPat: "Martínez", apMat: "Guerrero")
    	profesor7.save()
    	
    	def profesor8 = new Profesor(nombre: "Ismael", apPat: "Cervantes", apMat: "De Anda")
    	profesor8.save()

    	def profesor9 = new Profesor(nombre: "Rubén", apPat: "Ortega", apMat: "Gonzalez")
    	profesor9.save()

    	def profesor10 = new Profesor(nombre: "Juan Carlos", apPat: "Martínez", apMat: "Díaz")
    	profesor10.save()

    	def profesor11 = new Profesor(nombre: "José Luis", apPat: "Hernández", apmat: "Aguilar")
    	profesor11.save()

    	def profesor12 = new Profesor(nombre: "Alberto Jesús", apPat: "Alcántara", apMat: "Méndez")
    	profesor12.save()

    	def profesor13 = new Profesor(nombre: "Edmundo René", apPat: "Durán", apMat: "Camarillo")
    	profesor13.save()

    	def profesor14 = new Profesor(nombre: "Héctor Manuel", apPat: "Paz", apMat: "Rodríguez")
    	profesor14.save()

    	
    	//Periodos
    	def periodo1 = new Periodo(periodo: "2015-1")
    	periodo1.save()
    	def periodo2 = new Periodo(periodo: "2015-2")
    	periodo2.save()

    	//Tipos de Material
    	def tipo1 = new TipoMaterial()
        tipo1.tipo = "Multímetro"
        tipo1.descripcion = " "
    	tipo1.save()

    	def tipo2 = new TipoMaterial()
        tipo2.tipo = "Generador de Funciones"
        tipo2.descripcion = " "
    	tipo2.save()

    	def tipo3 = new TipoMaterial()
        tipo3.tipo = "Osciloscópio"
        tipo3.descripcion= " " 
    	tipo3.save()

    	def tipo4 = new TipoMaterial()
        tipo4.tipo = "Fuente de Poder"
        tipo4.descripcion = " "
    	tipo4.save()

    	//Estados del material
    	def estado1 = new Estado()
        estado1.nombre = "Óptimo"
        estado1.descripcion = " "
    	estado1.save()

    	def estado2 = new Estado()
        estado2.nombre = "Sin Baterias"
        estado2.descripcion = " "
    	estado2.save()

    	def estado3 = new Estado()
        estado3.nombre = "Averiado"
        estado3.descripcion = " "
    	estado3.save()

    	def estado4 = new Estado()
        estado4.nombre = "En Reparación"
        estado4.descripcion = " "
    	estado4.save()

    	def estado5 = new Estado()
        estado5.nombre = "No Disponible"
        estado5.descripcion = " "
    	estado5.save()

        //Materiales
        
        def material1 = new Material()
        material1.nombre= "1"
        material1.codigo= "1"
        material1.estado= estado1
        material1.tipoMaterial= tipo1
        material1.save()

        def material2 = new Material()
        material2.nombre= "2"
        material2.codigo= "2"
        material2.estado= estado2
        material1.tipoMaterial= tipo2
        material2.save()

        def material3 = new Material()
        material3.nombre= "3"
        material3.codigo= "3"
        material3.estado= estado3
        material3.tipoMaterial= tipo3
        material3.save()

        def material4 = new Material()
        material4.nombre= "4"
        material4.codigo= "4"
        material4.estado= estado4
        material4.tipoMaterial= tipo4
        material4.save()

        def material12 = new Material()
        material12.nombre= "12"
        material12.codigo= "12"
        material12.estado= estado1
        material12.tipoMaterial= tipo1
        material12.save()
        

    	//Instancias de Materias
        def instancia1 = new InstanciaMateria(titular: profesor1, auxiliar: profesor2, materia: materia1, periodo: periodo1,
            diaDeLaSemana: "Viernes", hora: "", grupo: "3CM2")
        instancia1.save()

        //Inscripciones de Alumnos a Instancias de Materias
        def inscripcion1 = new Inscripcion(alumno: alumno1, instanciaMateria: instancia1)
        inscripcion1.save()
        def inscripcion2 = new Inscripcion(alumno: alumno2, instanciaMateria: instancia1)
        inscripcion2.save()
        def inscripcion3 = new Inscripcion(alumno: alumno3, instanciaMateria: instancia1)
        inscripcion3.save()
        def inscripcion4 = new Inscripcion(alumno: alumno4, instanciaMateria: instancia1)
        inscripcion4.save()
        
        
        instancia1.inscripciones.add(inscripcion1)
        instancia1.inscripciones.add(inscripcion2)
        instancia1.inscripciones.add(inscripcion3)
        instancia1.inscripciones.add(inscripcion4)
        instancia1.save()
    }
    def destroy = {
    }
}
