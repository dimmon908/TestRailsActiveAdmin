(function($, window) {
  $.fn.replaceOptions = function(options) {
    var self, $option;

    this.empty();
    self = this;

    $.each(options, function(index, option) {
      $option = $("<option></option>")
        .attr("value", option.value)
        .text(option.text);
      self.append($option);
    });
  };
})(jQuery, window);

(function(){

  var photoCount;

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $(input).parent().find('img').attr('src', e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('change', 'input[type="file"]', function () {
    readURL(this);
  });
  $(document).on('change', '#product_region_id', function() {
    $.ajax({
      url: '/city/' + $(this).val(),
      success: function(data) {
        var options = [{text: '', value: ''}];
        (function() {
          for(var i = data.city.length - 1; i >=0 ; i--) {
            var city =  data.city[i];
            options[i+1] = {text: city.name, value: city.id};
          }
        })();
        $("#product_city_id").replaceOptions(options);
      }
    })
  });
  $(document).on('click', 'a.button.has_many_add', function() {

  });

  $(document).ready(function() {
    photoCount = $('')
  });
})();