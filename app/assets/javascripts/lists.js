// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){
  // ********************************************* \\
  // **********TT-TOOLTIP AJAX REQUESTS*********** \\
  // ********************************************* \\
  $(document).click(function(){
    $('.tt-tooltip').removeClass('is-hovered');
  });

  $('.tt-tooltip').on('click', function(e){
    var $thisTooltip = $(this);

    e.stopPropagation();
    if(!$thisTooltip.hasClass('is-hovered')) {
      console.log('BEGIN AJAX REQUEST');

      var item_id = $(this).attr('data-item-id');

      if ($.isNumeric(item_id)) {
        var path = "/items/" + item_id;
        $.getJSON(path, function(data){
          $thisTooltip.find('.item-name').text(data.name);
          $thisTooltip.find('.item-barcode').text(data.barcode);
          $thisTooltip.find('.item-description').text(data.description);

          $thisTooltip.addClass('is-hovered');
        });
      }

    } else {
      $(this).removeClass('is-hovered');
    }

  });


  // ********************************************* \\
  // **********ITEM AJAX SEARCH REQUEST*********** \\
  // ********************************************* \\

  function createItemSearchResult(imageSrc, itemName, barcode, description, itemId) {
    var $media_left = $('<div>').addClass('media-left');
    var $image = $('<img>').addClass('media-object').attr('width', '80').attr('height', '80').attr('src', imageSrc);
    $media_left.append($image);

    var $media_body = $('<div>').addClass('media-body');
    var $media_heading = $('<h4>').addClass('media-heading').text(itemName);
    var $barcode = $('<strong>').addClass('barcode').text(barcode);
    var $text = $('<p>').text(description);
    $media_body.append($media_heading).append($barcode).append($text);


    var $button = $('<button>').addClass("add-item-button btn btn-success").text('+');
    $button.attr('data-item-id', itemId);



    var $media = $('<div>').addClass('media');
    $media.append($media_left);
    $media.append($media_body);
    $media.append($button);

    return $media;
  }


  var $searchForm = $('#item-search-form');
  var $searchInput = $searchForm.find('#item-search');

  var $searchResults = $('#item-search-results');

  $searchInput.on('keyup', function(){
    var searchTerm = $(this).val();
    var path = "/items" + "?search=" + searchTerm;

    $searchResults.empty();
    if (searchTerm.length > 0) {

      $.getJSON(path, function(data){

        if (data.length > 0) {
          $searchResults.empty();
          $.each(data, function(index, item){
            var $li = createItemSearchResult("", item.name, item.barcode, item.description, item.id);
            $searchResults.append($li);
          });
        } else {
          $searchResults.empty();
        }



      });
    }

  });


























});
