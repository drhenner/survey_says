var SurveySays = window.SurveySays || {};

// If we already have the Question namespace don't override
if (typeof SurveySays.Question == "undefined") {
    SurveySays.Question = {};
}
// If we already have the purchaseOrder object don't override
if (typeof SurveySays.Question.answer == "undefined") {

    SurveySays.Question.answer = {
        //test    : null,
        initialize      : function( ) {

          jQuery('.add_association').bind('click', function(){
            var assoc = $(this).attr('data-association');
            var content = $('#' + assoc + '_fields_template').html();
            var regexp = new RegExp('new_' + assoc, 'g');
            var new_id = new Date().getTime();
            $(this).parent().before(content.replace(regexp, new_id));
            return false;
          });

          $('form a.remove_child').live('click', function() {
            var hidden_field = $(this).prev('input[type=hidden]')[0];
            if(hidden_field) {
              hidden_field.value = '1';
            }
            $(this).parents('.new_fields').remove();
            $(this).parents('.fields').hide();
            return false;
          });

        },
        prefillCost : function() {

        }
    };

    jQuery(function() {
      SurveySays.Question.answer.initialize();
    });
}