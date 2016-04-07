$(document).ready(function(){
	var $newItemModal = $('#newItemModal');
	var $modal_save_button = $newItemModal.find('#new-item-save-button');

/*
	$modal_save_button.addClass('not-active');
	$modal_save_button.css('opacity', 0.6);
*/



	$modal_save_button.on('click', function(event){
		if ($(this).hasClass('not-active')) {
			event.preventDefault();
		}
	});


	var make_save_available = function() {
		if ($modal_save_button.hasClass('not-active')) {
			$modal_save_button.removeClass('not-active');
			$modal_save_button.animate({ opacity: 1.0 }, 400, function() {
				// Animation complete.
			});
		}
	};

	var make_save_unavailable = function(){
		console.log('unavaiable');
		if (!$modal_save_button.hasClass('not-active')) {
			$modal_save_button.addClass('not-active');
			$modal_save_button.animate({ opacity: 0.6 }, 400, function() {
				// Animation complete.
			});
		}

	};





	var $input_new_item_name = $newItemModal.find('#newItemName');
	var $input_new_item_barcode = $newItemModal.find('#newItemBarcode');
	var $input_choose_existing_item = $newItemModal.find('#itemSelect');

	var onChangeFunction = function(){
		var nameLength = $input_new_item_name.val().length;
		var barcodeLength = $input_new_item_barcode.val().length;

		if (nameLength > 0 && nameLength <= 140 && barcodeLength > 0) {
			make_save_available();
		} else {
			make_save_unavailable();
		}
	};

	$input_choose_existing_item.on('change', function(){
		if ($(this).val() != "") {
			make_save_available();
		}
	});
	$('#newItemForm').on('change keyup paste', 'input.check-input', onChangeFunction);



	// **** WHEN TRIED TO SUBMIT FORM. Click on button or press enter.
	$('#newItemForm').on('submit', function(e){
		console.log('submit function');

		var nameLength = $input_new_item_name.val().length;
		var barcodeLength = $input_new_item_barcode.val().length;

		if (nameLength > 0 && nameLength <= 140 && barcodeLength > 0) {
			console.log('Alles klopt. Form will be submitted');
		} else {
			e.preventDefault();
			alert('You have to fill in the name and barcode!');
		}
	});


	// *** Laat Gebruiker kennis maken met de opacity kleur en zet Save standaard op unavailable
	$newItemModal.on('shown.bs.modal', make_save_unavailable);
	$newItemModal.on('hide.bs.modal', make_save_available);
	// *** Verwijder ingevoerde gegevens bij sluiten modal
	$("#newItemModal").on('hidden.bs.modal', function() {
		$newItemModal.find('input').val("");
		$newItemModal.find('textarea').val("");
		$newItemModal.find('#previewImage').removeClass('image-chosen').removeAttr("style");
	});






});
