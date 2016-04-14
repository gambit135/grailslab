package lab

class User {
    String name;
    String password;
    
    static constraints = {
        name (blank:false, nullable:false,size:5..15,matches:/[\S]+/, unique:true)
        password (blank: false)
    }
}
