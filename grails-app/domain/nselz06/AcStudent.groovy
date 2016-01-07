package nselz06

class AcStudent {

	Long id
    String Fname;
	String Lname;
	String acId;
	Integer year;

	def totalHours(){
		def total = 0
		ops.each {
			total+= it.duration
		}
		return total
	}	
	
	static hasMany=[ops:  ServiceOps]
	static mapping = {
		ops cascade: "all-delete-orphan"
	}

    static constraints = {
		acId unique: true	
    }
}
