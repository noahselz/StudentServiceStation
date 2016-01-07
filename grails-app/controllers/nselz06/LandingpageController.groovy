package nselz06

class LandingpageController {

    def index() { 
		def myServs = ServiceOps.list()
		def myStuds = AcStudent.list()
		def grandTot = 0
		def totalYear = 0
		int year = Calendar.getInstance().get(Calendar.YEAR);
		myServs.each{
			grandTot += it.duration
			if(Integer.parseInt(it.start.substring(0, 4)) == (year))
				totalYear += it.duration
		}
		
		def numGS = 0
		myStuds.each{
			if(it.totalHours() > 20)
			numGS +=1
		}
		
		def myKPI = new KPI(grandTotal : grandTot, numGreatStuds : numGS, totalHoursYear : totalYear )
		[kpi : myKPI]
	}
}
