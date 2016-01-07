package nselz06

class HoursController {

    def servlist(){  //renders the students for the list.gsp
		//creates lists
		def myServs = ServiceOps.list()
		def myStuds = AcStudent.list()
		// renders lists
		[ servs : myServs, students : myStuds]
	}
	
	def ajax_servcreateform(){
		def sid = params.sid as long
		def boop = AcStudent.get(sid)
		render view: "_createservform", model:[stud:boop]
	}
	
	def ajax_servcreate(){
		def newOp = new ServiceOps(acId : params.acid, duration : params.duration, start : params.start,  event : params.event, org : params.org)
		//newOp.addToStud(AcStudent.get(params.id))
		AcStudent.get(params.id).addToOps(newOp)
		AcStudent.get(params.id).save(flush: true, failOnError: true)
		render view: "_serviceRow", model:[servop:newOp]
	}
}


