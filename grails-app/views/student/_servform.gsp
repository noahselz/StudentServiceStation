
<div class="panel-heading">
              <h3 class="panel-title">Edit Service Op</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When editing service Ops, all field are required.</p>
            </div>
            
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden">
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create a student!
	  		</div>
            <div class="panel-body">
            	<form id = "editservform" class="form-horizontal">	  
				  <div class="form-group">
				    <label for="labelduration" class="col-sm-2 control-label">Duration:</label>
				    <div class="col-sm-10">
				      <input name = "duration" type="text" class="form-control" id="duration" value = "${servop.duration}" placeholder="enter number of hours">
				    </div>
				  </div>
				  
				  <input id = "id" name = "id" type = "text" style = "visibility: hidden" value = "${servop.id}">
           		  <input id = "acId" name = "acId" type = "text" style = "visibility: hidden" value = "${servop.acId}">	
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Date:</label>
				    <div class="col-sm-10">
				      <input name = "start" type="date" class="form-control" value = "${servop.start}"  id="start">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelevent" class="col-sm-2 control-label">Event:</label>
				    <div class="col-sm-10">
				      <input name = "event" type="text" class="form-control" id="event" value = "${servop.event}"  placeholder="enter event name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelorg" class="col-sm-2 control-label">Organization:</label>
				    <div class="col-sm-10">
				      <input name = "org" type="text" class="form-control" id="org" value = "${servop.org}"  placeholder="enter affiliated organization">
				    </div>
				  </div>
				</form>
</div>
