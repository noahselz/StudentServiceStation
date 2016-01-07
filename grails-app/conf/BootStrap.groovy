import nselz06.AcStudent
import nselz06.ServiceOps
import nselz06.Agency
class BootStrap {

    def init = { servletContext ->
		def e = new Agency(name : "APO")
		def f = new Agency(name : "SPCA")
		def g = new Agency(name : "Haas")
		def h = new Agency(name : "EPI")
		
		def s = new AcStudent(Lname : "Selz", Fname : "Noah", acId: "1234567", year: 2013)
		def sa = new ServiceOps(acId : "1234567", duration : 4, start : "2014-04-15", event : "ASB", org : "APO")
		s.addToOps(sa)
		
		def sb = new ServiceOps(acId : "1234567", duration : 5, start : "2015-10-06", event : "GDoS", org : "APO")
		s.addToOps(sb)
		
		def sc = new ServiceOps(acId : "1234567", duration : 1, start : "2015-10-16", event : "JanServ", org : "SPCA")
		s.addToOps(sc)
		
		def sd = new ServiceOps(acId : "1234567", duration : 2, start : "2015-10-30", event : "RooBoo", org : "APO")
		s.addToOps(sd)
		
		def se = new ServiceOps(acId : "1234567", duration : 3, start : "2016-02-02", event : "GroundhogFest", org : "EPI")
		s.addToOps(se)
		
		s.save(flush:true, failOnError:true)
		
		
		def a = new AcStudent(Lname : "Keller", Fname : "Shel", acId: "7654321", year: 2012)
		def aa = new ServiceOps(acId : "7654321", duration : 2, start : "2015-01-28", event : "JanServ", org : "Haas")
		a.addToOps(aa)
		
		def ab = new ServiceOps(acId : "7654321", duration : 1, start : "2016-01-28", event : "JanServ", org : "Haas")
		a.addToOps(ab)
		
		a.save(flush:true)
		
		
		def b = new AcStudent(Lname : "Caravello", Fname : "Anthoni", acId: "2351645", year: 2015)
		
		def ba = new ServiceOps(acId : "2351645", duration : 21, start : "2015-10-30", event : "RooBoo2", org : "APO")
		b.addToOps(ba)
		
		b.save(flush:true)
		
		
		def c = new AcStudent(Lname : "Wright", Fname : "Charlotte", acId: "7954325", year: 2012)
		c.save(flush:true)
		
		
		def d = new AcStudent(Lname : "Pancakes", Fname : "Devon", acId: "8462159", year: 2013)
		d.save(flush:true)
		
		
		e.save(flush:true)
		f.save(flush:true)
		g.save(flush:true)
		h.save(flush:true)
		
	}
    def destroy = {
    }
}
