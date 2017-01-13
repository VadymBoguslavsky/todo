// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js


function batchDeletion() {
    var form = document.getElementsByClassName('batch-del-form')[0],
        buttonSubmit, checkboxes;

    if (form == undefined) return;

    buttonSubmit = form.getElementsByClassName('batch-del-submit')[0];
    checkboxes = form.getElementsByClassName('batch-del-checkbox');

    form.addEventListener("click", toggleButtonSubmit);
    $(document).ajaxComplete(function(event, request) {
        buttonSubmit.classList.remove("active");
    });

    function toggleButtonSubmit(e) {
        var target = e.target, checkedOne;

        while (target != this) {
            if (target.classList.contains('batch-del')) {
                if (target.classList.contains('batch-del-checkall')) {
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = target.dataset.checkall == "true";
                    }
                }

                checkedOne = Array.prototype.slice.call(checkboxes).some(function(x){return x.checked});

                if (checkedOne) {
                    buttonSubmit.classList.add('active');
                } else {
                    buttonSubmit.classList.remove('active');
                }
                return;
            }
            target = target.parentNode;
        }
    }
}

batchDeletion();