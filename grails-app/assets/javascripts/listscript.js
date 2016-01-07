$(document).ready(
	
	function(){
		var currentrow = 0;
		
	// FOR LANDING PAGE
		$('#toList').click( // goes back to the list page
				function(){
					window.location = "/nselz06/student/list";
				}
			);
		
		$('#toservList').click( // goes back to the list page
				function(){
					window.location = "/nselz06/hours/servlist";
				}
			);
		$('#toagencyList').click( // goes back to the list page
				function(){
					window.location = "/nselz06/agency/list";
				}
			);
	//FOR DIALOGS AND DATATABLES
		//FOR STUDENT
		$('#formpanel').dialog({ // create students form 
			dialogClass: "no-close",
			autoOpen: false,
			resizeable: true,
			width: 900,
			modal: true
		});
		
		$('#servpanel').dialog({ // create servOps form 
			dialogClass: "no-close",
			autoOpen: false,
			resizeable: true,
			width: 900,
			modal: true 
		});
		
		$('#editformpanel').dialog({ // edit students form
			dialogClass: "no-close",
			autoOpen: false,
			resizeable: true,
			width: 900,
			modal: true
		});

		
		$('#Add').click( //on adduser button action
			function(){
				$('#formpanel').dialog("open");
		});
		
		$('#Delete').click( // sends delete request to controller
			function(){
				window.location = "/nselz06/student/delete/?id=" + this.name;
			}
			 
		);
		
		$('#Edit').click( // shows edit user form
			function(){
				$('#editformpanel').dialog("open");
			}
		);
		
		$('#studentReport').click( // gets student report
				function(){
					window.location = "/nselz06/report/student/" + $(this).attr('name');
				}
			);
		
		$('#semesterReport').click( // gets semester report
				function(){
					window.location = "/nselz06/report/semester/" + $(this).attr('name');
				}
			);
		
		$('#servCreate').click( //on adduser button action
				function(){
					$('#servpanel').dialog("open");
			});
			
		
		
		//FOR HOURS
		
		$('#tblStuds').DataTable({ // makes the student table searcheable and sorteable
			"paging": false
			//scrollY: true
		});
		
		$('#servtable').DataTable({ // makes the service op table searcheable and sorteable
			"paging": false
			//scrollY: true
		});	
		
		$('#studlistpanel').dialog({ // edit students form
			dialogClass: "no-close",
			autoOpen: false,
			resizeable: true,
			width: 900,
			modal: true
		});
		
		$("#servlistCreate").click(
				function(){
					$('#studlistpanel').dialog("open");
				}
		);
		
		//FOR AGENCY
		$('#createagencypanel').dialog({ // edit students form
			dialogClass: "no-close",
			autoOpen: false,
			resizeable: true,
			width: 900,
			modal: true
		});
		
	// AJAX calls
		//FOR AGENCY
		$("#createAgency").click(
				function(){
					$('#createagencypanel').dialog("open");
				}
		);
		$('#createAg').click( //on createAg button action
				function(){
					$.ajax({
						url: "/nselz06/agency/ajax_create",
						data: $('#createagencyform').serialize(),
						success: function(result){
							alert(result)
							$('#agencytable:last-child').append("<tr>" + result + "</tr>");
						}
					});
					$('#createagencypanel').dialog("close");
					$('#createagencyform').trigger('reset');
			});
		$('#agencytable').on("click", ".deleteAg", //on delete button action
				function(){
					alert("Are you sure?")
					var oid = $(this).attr('name');
					currentrow = $(this).closest('tr');
					$.ajax({
						url: "/nselz06/agency/ajax_delete",
						data: {oid: oid},
						success: function(result){
							currentrow.closest("tr").remove();
						}
					});
			});
		$('#agencytable').on("click", ".editAg", //on edit button action
				function(){
					var opid = $(this).attr('oid');
					currentrow = $(this).closest('tr');
					$.ajax({
						url: "/nselz06/agency/ajax_editform",
						data: {oid:opid},
						success: function(result){
							$('#editagencypanel').html(result); // makes the edit form, populates it with current agency parameters
							$('#editagencypanel').dialog({
								closeOnEscape: false,
								open: function(event, ui) { $('.ui-dialog-titlebar-close').hide(); },
								draggable: false,
								width: 'auto',
								buttons: {
									"Submit":function(){ // makes a button that submits the data to the server and the table
										alert($("#editagencyform").serialize())
										$.ajax({
											url: "/nselz06/agency/ajax_edit",
											data: $("#editagencyform").serialize(),
											success: function(result){
												alert(result)
												currentrow.closest("tr").html(result); // take the parameters from the edit form and sends them to the controller
											}
										});
										$(this).dialog("close");
										$('#editagencyform').empty();
									},
									"Cancel":function(){ // creates a close button thats not ugly
										$('#editagencyform').empty();
										$(this).dialog("close");
									}
								}
							});
						}
					});	
			});
		
	
		//FOR HOURS
		$('#tblStuds').on("click", ".select", //on select student	
				function(){
					$('#studlistpanel').dialog("close");
					var id = $(this).attr('name');
					$.ajax({
						url: "/nselz06/hours/ajax_servcreateform",
						data: {sid:id},
						success: function(result){
							$('#createservpanel').html(result); 
							$('#createservpanel').dialog({
								closeOnEscape: false,
								open: function(event, ui) { $('.ui-dialog-titlebar-close').hide(); },
								draggable: false,
								width: 'auto',
								buttons: {
									"Submit":function(){ // makes a button that submits the data to the server and the table
										$.ajax({
											url: "/nselz06/hours/ajax_servcreate",
											data: $("#servform").serialize(),
											success: function(result){
												$('#servtable:last-child').append("<tr>" + result + "</tr>");
											}
										});
										$(this).dialog("close");
										$('#servform').empty();
									},
									"Cancel":function(){ // creates a close button thats not ugly
										$('#servform').empty();
										$(this).dialog("close");
									}
								}
							});
						}
					});			
			});
		
			//FOR STUDENT
		$('#createOp').click( //on createOp button action
				function(){
					$.ajax({
						url: "/nselz06/student/ajax_create",
						data: $('#servform').serialize(),
						success: function(result){
							$('#servtable:last-child').append("<tr>" + result + "</tr>");
						}
					});
					$('#servpanel').dialog("close");
					$('#servform').trigger('reset');
			});
		
		$('#servtable').on("click", ".delete", //on delete button action
				function(){
					alert("Are you sure?")
					var oid = $(this).attr('name');
					currentrow = $(this).closest('tr');
					$.ajax({
						url: "/nselz06/student/ajax_delete",
						data: {oid: oid},
						success: function(result){
							currentrow.closest("tr").remove();
						}
					});
			});
		
		$('#servtable').on("click", ".edit", //on edit button action
				function(){
					var opid = $(this).attr('oid');
					currentrow = $(this).closest('tr');
					$.ajax({
						url: "/nselz06/student/ajax_editform",
						data: {oid:opid},
						success: function(result){
							//alert(result)
							$('#editservpanel').html(result); // makes the edit form, populates it with current service objects parameters
							$('#editservpanel').dialog({
								closeOnEscape: false,
								open: function(event, ui) { $('.ui-dialog-titlebar-close').hide(); },
								draggable: false,
								width: 'auto',
								buttons: {
									"Submit":function(){ // makes a button that submits the data to the server and the table
										$.ajax({
											url: "/nselz06/student/ajax_edit",
											data: $("#editservform").serialize(),
											success: function(result){
												currentrow.closest("tr").html(result); // take the parameters from the edit form and sends them to the controller
											}
										});
										$(this).dialog("close");
										$('#editservform').empty();
									},
									"Cancel":function(){ // creates a close button thats not ugly
										$('#editservform').empty();
										$(this).dialog("close");
									}
								}
							});
						}
					});	
			});
		
	});