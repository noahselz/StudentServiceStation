package nselz06

class Agency {
	String name
	
    static constraints = {
		name unique: true
    }
}
