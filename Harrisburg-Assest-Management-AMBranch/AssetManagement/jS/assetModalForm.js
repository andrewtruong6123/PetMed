function ModalPopup() {
    $("#modalpopup ").dialog({
        modal: true,
        width: 800,
        appendTo: "form",
        open: function () {

            // The two lines below are 2 different ways to ensure the 
            // background is completely grayed out if the modal is larger
            // then the page. The first was chosen so that the scroll
            // bars are not disabled.
            $('.ui-widget-overlay').css('position', 'fixed');
            //$('body').css('overflow', 'hidden');
            $(this).dialog('option', 'position', 'center');
        },
        buttons: {
            "Submit": function () {
                $("[id*=btnSubmitAsset]").click();
            },

            "Cancel": function () {
                if (confirm("Are you sure you want to cancel ?")) {
                    $("[id*=btnCancelAddAsset]").click();
                }
            }
        },
        close: function (ev, ui) {
            $(this).remove();
            $('.ui-widget-overlay').css('position', 'absolute');
        }
    });
}