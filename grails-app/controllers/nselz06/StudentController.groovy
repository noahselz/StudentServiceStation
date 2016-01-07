package nselz06

class StudentController {
	
	def list(){  //renders the students for the list.gsp
		//this is a list
		def myStudents = AcStudent.list()
		// key    :    stuff
		
		def myServs = ServiceOps.list()
		def grandTot = 0
		def totalYear = 0
		int year = Calendar.getInstance().get(Calendar.YEAR);
		println("cur = " + year)
		myServs.each{
			grandTot += it.duration
			if(Integer.parseInt(it.start.substring(0, 4)) == (year))
				totalYear += it.duration
		}
		
		def numServers = 0
		def totalHours = 0
		myStudents.each{
			def tot = it.totalHours()
			totalHours += tot
			if(tot > 0)
				numServers +=1
		}
		def perc = numServers/myStudents.size()*100
		def avg = totalHours/myStudents.size() 
		
		[ students : myStudents, numStuds : myStudents.size(), percStuds : perc, avgHours : avg, yearTotal : totalYear, grandTotal : totalHours]
	}
	

	def profile(){ // renders the student currently being focused on 
		[ currentStud : AcStudent.get(params.id)]
	}
	def create(){ // grabs form data and creates a new student
		def newb = new AcStudent(Lname : params.lname, Fname : params.fname, acId: params.acid, year: params.year)
		newb.save()
	}
	
	def delete(){  //deletes the student being focused on
		def todel = AcStudent.get(params.id)
		todel.delete(flush: true)
	}
	def edit(){ // edits the student being focused on
		def toedit = AcStudent.get(params.id)
		toedit.properties = params  //sets the parameters in the url to the properties of the student
		toedit.save(flush: true)
		[ curstud : toedit] // holds on to student so we can go back to their profile page
	}
	
	def ajax_create(){ // creates a new servop using parameters from an ajax call
		def newOp = new ServiceOps(acId : params.acid, duration : params.duration, start : params.start,  event : params.event, org : params.org)
		//newOp.addToStud(AcStudent.get(params.id))
		AcStudent.get(params.id).addToOps(newOp)
		AcStudent.get(params.id).save(flush: true, failOnError: true)
		render view: "_serviceRow", model:[servop:newOp]
	}
	def ajax_edit(){
		def id = params.id 
		def toedit = ServiceOps.get(id)
		toedit.properties = params  //sets the parameters from the ajax form to the properties of the service op
		toedit.save(flush: true,  failOnError: true)
		render view: "_serviceRow", model:[servop:toedit]
	}
	def ajax_editform(){ // makes a service op edit form using the properties passed in from the ajax
		def oid = params.oid as int
		def boop = ServiceOps.get(oid)
		render view: "_servform", model:[servop:boop]
	}
	
	def ajax_delete(){ // deletes the servop using the id that the delete jquery sends
		def id = params.oid
		ServiceOps.get(id).delete(flush: true)
		render "complete"
	}
}