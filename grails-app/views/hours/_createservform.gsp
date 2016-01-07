<div class="panel-heading">
              <h3 class="panel-title">New ServiceOp</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When creating new ServiceOp, all field are required.</p>
            </div>
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden";>
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create a student!
	  		</div>
            <div class="panel-body">
            	<form id = "servform" class="form-horizontal">
            		<input name = "acid" type="text" class="form-control" id="acid" style= "visibility: hidden" value = "${stud.acId}">
					<input name = "id" type="text" class="form-control" id="id" style= "visibility: hidden" value = "${stud.id}">				  
				  <div class="form-group">
				    <label for="labelduration" class="col-sm-2 control-label">Duration:</label>
				    <div class="col-sm-10">
				      <input name = "duration" type="text" class="form-control"  id="duration" placeholder="enter number of hours">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Date:</label>
				    <div class="col-sm-10">
				      <input name = "start" type="date" class="form-control" id="start">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelevent" class="col-sm-2 control-label">Event:</label>
				    <div class="col-sm-10">
				      <input name = "event" type="text" class="form-control" id="event" placeholder="enter event name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelorg" class="col-sm-2 control-label">Organization:</label>
				    <div class="col-sm-10">
				      <input name = "org" type="text" class="form-control" id="org" placeholder="enter affiliated organization">
				    </div>
				  </div>
				</form>
            </div>