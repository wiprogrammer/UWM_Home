

document.addEventListener("turbolinks:load", function () {
    $("#widgets").sortable({

        update: function (e, ui) {

            Rails.ajax({
                url: $(this).data("url"),
                type: "PATCH",
                data:$(this).sortable('serialize')
            })


        }
    });

    var $user_form = $("#user_settings_form");

    $("#user_setting_submit").click(function (e) {

        console.log($user_form.attr('action'));

        Rails.ajax({
            url: $user_form.attr('action'),
            type: "PATCH",
            data: $user_form.serialize(),
            success: function() {
                location.reload();
            }
        });

    });

});