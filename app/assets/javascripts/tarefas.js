// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
	$('.remove-tarefa').bind('ajax:success', function(){
		var elemento_id = $(this).data('elemento_id');
		$('#'+elemento_id).remove();
	});
	
	$("#nova-tarefa").click(function() {
	  url = $(this).data('url');
	  $.ajax({
	    url: url,
	    success: function(response) {
	      $("#myModal").html(response);
	    } 
	  });
	});
	
	$(document).on('click',"#salvar",function() {
	  $("form#form_projeto_tarefa").submit();
	}); 
	
	$(document).on('submit',"form#form_projeto_tarefa",function(e) {
	  e.preventDefault();
	  console.log('foi');
	  $.ajax({
	    url: $(this).attr('action'),
	    type: $(this).attr('method'),
	    data: $(this).serialize(),
	    success: function(response) {
	      document.location.reload();
	    },
	    error: function(response) {
	      $('#myModal').html(response.responseText);
	    }
	  });
	  
	});
	
})
