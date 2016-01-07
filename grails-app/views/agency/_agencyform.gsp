<div class="panel-heading">
              <h3 class="panel-title">Edit Agency</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When editing Agency, all field are required.</p>
            </div>
            
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden">
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create an Agency!
	  		</div>
            <div class="panel-body">
            	<form id = "editagencyform" class="form-horizontal">	  
				  <div class="form-group">
				    <label for="labelduration" class="col-sm-2 control-label">Name:</label>
				    <div class="col-sm-10">
				      <input name = "name" type="text" class="form-control" id="name" value = "${ag.name}" placeholder="enter agency name">
				    </div>
				  </div>
				  
				  <input id = "id" name = "id" type = "text" style = "visibility: hidden" value = "${ag.id}">
				</form>
</div>
