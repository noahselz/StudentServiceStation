package nselz06

class ReportController {

    def student(){
		def myStud = AcStudent.get(params.id)
		def myServs = myStud.ops
		// generate KPI stats
		def grandTot = 0
		def totalYear = 0
		int year = Calendar.getInstance().get(Calendar.YEAR);
		myServs.each{
			grandTot += it.duration // calcs grand total
			if(Integer.parseInt(it.start.substring(0, 4)) == (year))
				totalYear += it.duration // calcs total for current year
		}
		[stud : myStud, year : year, grandtotal : grandTot, yeartotal : totalYear, servs : myServs]
	}
	
	//
	
	def semester(){
		def myStud = AcStudent.get(params.id)
		def myServs = myStud.ops
		
		def grandTot = 0
		def totalYear = 0
		int year = Calendar.getInstance().get(Calendar.YEAR)
		ArrayList<Semester> sems = new ArrayList<Semester>() // master list of semesters to reported
		myServs.each{ // runs through all the students service ops
			 
			String[] array = it.start.split("-") // splits date into parseable chunks
			
			grandTot += it.duration
			if(Integer.parseInt(array[0]) == (year))
				totalYear += it.duration
				
			boolean newsemester = true // boolean to determine if we need to make add a new semester to the list
			
			for(int a = 0; a < sems.size(); a++){ // checks current service objects against all sems on master list
				if(sems.get(a).samesem(it)){
					sems.get(a).getIt(it)
					newsemester = false // sets it to false if we dont need a new semester
				}
			}
			if(newsemester){ // if we do need a new semester
				Semester sem = new Semester() // we create a new semester
				sem.getIt(it) // using the parameters in the current service op
				sems.add(sem) // and add it to the master list
			}
			
		}
			
		
		[stud : myStud, year : year, grandtotal : grandTot, yeartotal : totalYear, Semesters : sems]
	}
	
}
