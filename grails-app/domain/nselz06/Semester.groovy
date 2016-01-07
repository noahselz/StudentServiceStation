package nselz06

class Semester {
	String season
	String year
	int hours = 0
	
	def getIt(ServiceOps serv){
		String[] array = serv.start.split("-")
		year = array[0]
		if(Integer.parseInt(array[1]) > 6)
			season = "Fall"
		else
			season = "Spring"
		hours += serv.duration
	}
	
	def samesem(ServiceOps serv){
		String[] array = serv.start.split("-")
		if(!array[0].equals(year))
			return false
		def foo
		if(Integer.parseInt(array[1]) > 6)
			foo = "Fall"
		else
			foo = "Spring"
		if(!foo.equals(season))
			return false
		return true
	}
    static constraints = {
    }
}
