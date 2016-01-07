package nselz06

class AgencyController {

    def list() { 
		def loost  = Agency.list()
		
		[agency : loost]
	}
	
	def ajax_delete(){
		def id = params.oid
		Agency.get(id).delete(flush: true)
		render "complete"
	}
	def ajax_edit(){
		def id = params.id
		def toedit = Agency.get(id)
		toedit.properties = params  //sets the parameters from the ajax form to the properties of the agency
		toedit.save(flush: true,  failOnError: true)
		render view: "_agencyRow", model:[ag:toedit]
	}
	def ajax_editform(){ // makes a agency edit form using the properties passed in from the ajax
		def oid = params.oid as int
		def boop = Agency.get(oid)
		render view: "_agencyform", model:[ag:boop]
	}
	def ajax_create(){ // creates a new servop using parameters from an ajax call
		def newAg = new Agency(name : params.name)
		newAg.save(flush: true)
		render view: "_agencyRow", model:[ag:newAg]
	}
}
