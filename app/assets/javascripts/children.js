$('.children.new').ready(function() {
	$('input#school_name').focusout(function(){
		if($('input#school_name').val().length == 0){
			addErrorMessage($(this));
		} else{
			removeMessage($(this));
		}
	});

	$('input#school_district_name').focusout(function(){
		if($('input#school_district_name').val().length == 0){
			addErrorMessage($(this));
		} else{
			removeMessage($(this));
		}
	});

	$('input#date_of_birth_two').focusout(function(){
		if($('input#date_of_birth_two').val().length == 0){
			addErrorMessage($(this));
		} else{
			removeMessage($(this));
		}
	})

	$('input#guardian_first_name').focusout(function(){
		if($('input#guardian_first_name').val().length == 0){
			addErrorMessage($(this));
		} else{
			removeMessage($(this));
		}
	})

	$('input#guardian_last_name').focusout(function(){
		if($('input#guardian_last_name').val().length == 0){
			addErrorMessage($(this));
		} else{
			removeMessage($(this));
		}
	})

	function removeMessage(obj){
		if(obj.next().hasClass("message")){
			obj.next().remove();
		}
	}

	function addErrorMessage(obj){
		if(!obj.next().hasClass("message")){
			obj.after('<label for="' + obj.attr('id') + '" class="message" style="display: inline-block;">cant be blank</label>');
		}
	}


});