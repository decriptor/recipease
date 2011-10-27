$(function() {
	$('#recipe_form').ajaxForm({
		clearForm: true,
		beforeSubmit: function(formData, jqForm, options) {
			var field_length = $('#id_description').fieldValue()[0].length;
			if(field_length > 2) {
				return false;
			}
			return true;
		},
		success: function(response_text, status_text) {
			$('my_recipe').fadeOut('fast', function() {
				$('#my_recipe').html(response_text)
				$('#my_recipe').fadeIn('fast');
			});
		}
	});
});
