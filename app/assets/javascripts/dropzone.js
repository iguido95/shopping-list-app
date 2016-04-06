$(document).ready(function(){
	// var previewImageId = 'uploadPreview';
	// var $previewImage = $('#'.concat(previewImageId));

	var fileInputFieldId = 'uploadImage';
	var $fileInputField = $('#'.concat(fileInputFieldId));



	function setPreviewImage(files) {
		if (files && files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				//$previewImage.attr('src', e.target.result);
				$('#previewImage').css('background-image', 'url(' + e.target.result + ')').addClass('image-chosen');
				$('#dropzone').css('color', '#ffffff');
			};
			reader.readAsDataURL(files[0]);
		}
	}
	$fileInputField.change(function(){
	    setPreviewImage(this.files);
	});




	var dropzone = document.getElementById('dropzone');

	dropzone.ondrop = function(e) {
		e.preventDefault();
	// 	this.className = 'dropzone';
		this.classList.remove('dragover');

		var files = e.dataTransfer.files;

		setPreviewImage(files);
	};

	dropzone.ondragover = function() {
	// 	this.className = "dropzone dragover";
		this.classList.add('dragover');
		return false;
	};

	dropzone.ondragleave = function() {
	// 	this.className = 'dropzone';
		this.classList.remove('dragover');
		return false;
	};


});
