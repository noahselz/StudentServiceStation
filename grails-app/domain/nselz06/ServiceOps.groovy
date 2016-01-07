package nselz06

class ServiceOps {
	
	Long id
	String acId
	double duration
	String start
	String event
	String org

    static constraints = {
		org nullable:true, blank: true
    }
	static belongsTo = [
		stud : AcStudent
	]
	
	
}
