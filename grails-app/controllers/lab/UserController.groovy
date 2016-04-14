package lab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class UserController {
	static defaultAction='login'

	//Agregar una acción para validar sesión iniciada como un aspecto
	/*
	def beforeInterceptor ={
		System.out.println("before")
		if(!session?.user){
			System.out.println("before in condition")
			redirect(controller:"laboratorio")
		}
	}*/

	def events(){}

    def index() {
    	params.max = 10
 		session.users = User.count()
        respond User.list(params), model:[users: User.list(params), userInstanceCount: User.count()] 	
    }
    /*
    def users(){
 		params.max = 10
 		session.users = User.count()
        respond User.list(), model:[users: User.list(), userCount: User.count()]
    }*/

    /*
    def showUser(User userInstance){
    	respond userInstance
    }*/
    def show(User userInstance){
    	respond userInstance    	
    }
    def create() {
        respond new User(params)
    }

    def edit(User userInstance) {
        respond userInstance
    }
    
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
										args: [
											message(
												code: 'user.label', 
												default: 'Usuario'
												), 
											userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

     @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
										args: [message
												(code: 'user.label', 
												default: 'Usuario'), 
										userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }


     @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'user.deleted.message', args: [message(code: 'user.label', default: 'Usuario'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
	def login(LoginCommand cmd) {
		if(request.method == 'POST') {
		    if(!cmd.hasErrors()) {
                session.user = cmd.getUser()
                session.login= "success";
                if (cmd?.name == "admin"){
                    //Vista de admin
                    redirect controller: 'laboratorio', action:'index'
                }
                else{
                    //Vistsa de usuarios mortales
                    
                }
            } 
		    else {
		      render view:'/laboratorio/index', model:[loginCmd:cmd]
		    }
		} 
		else {
		    render view:'/laboratorio/index'
		}
	}

	def logout(){
		session.invalidate()
		redirect(controller:"laboratorio")

	}
}
class LoginCommand {
	String name
	String password
	private u
	User getUser() { 
		if(!u && name){
			u = User.findByName(name, [fetch:name])
			if (!u){
				if (name == "admin"){
				 	if (password == "admin"){
                        /*
						u = new User()
						u.name = name
						u.password = password
						u.save()*/
					}
					else{
						//return "user.password.invalid"
					}
				}
			}
		}

		return u
	}
	 static constraints = {
        name blank:false, validator:{ val, obj ->
            if(!obj.user)
              return "user.not.found"
        }
        password blank:false, validator:{ val, obj ->                                          
            //if(obj.user=="admin" && object.user.password != "admin")
            	//return "something"
            if(obj.user && obj.user.password != val)
              return "user.password.invalid"
        }
	}
}