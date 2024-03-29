"use strict";
$(document).ready(function () {
  function reIndex() {
    var countPEs = 0;
    var countEDs = 0;

    $(".item-PE").each(function () {
      countPEs++;

      $(this).find('.btn-CPE').each(function () {
        $(this).attr('data-target', `#collapsePE${countPEs}`);
        $(this).attr('aria-controls', `collapsePE${countPEs}`);
      });

      $(this).find('div[id^="collapsePE"]').each(function () {
        $(this).attr('id', `collapsePE${countPEs}`);
        $(this).attr('aria-labelledby', `headingPE${countPEs}`);
      });
    });

    $(".item-ED").each(function () {
      countEDs++;

      $(this).find('.btn-CED').each(function () {
        $(this).attr('data-target', `#collapseED${countEDs}`);
        $(this).attr('aria-controls', `collapseED${countEDs}`);
      });

      $(this).find('div[id^="collapseED"]').each(function () {
        $(this).attr('id', `collapseED${countEDs}`);
        $(this).attr('aria-labelledby', `headingED${countEDs}`);
      });
    });

    $("#countPEs").attr("value",countPEs);
    $("#countEDs").attr("value",countEDs);
  }
  $('.repeater').repeater({
    // (Optional)
    // "defaultValues" sets the values of added items.  The keys of
    // defaultValues refer to the value of the input's name attribute.
    // If a default value is not specified for an input, then it will
    // have its value cleared.
    defaultValues: {
      'text-input': 'foo'
    },
    // (Optional)
    // "show" is called just after an item is added.  The item is hidden
    // at this point.  If a show callback is not given the item will
    // have $(this).show() called on it.
    show: function () {
      $(this).slideDown();
      $(function () {
        $('select').each(function () {
          $(this).select2({
            theme: 'bootstrap4',
            width: 'style',
            allowClear: true,
            placeholder: "Choose..."
          });
        });
      });
      reIndex();
    },
    // (Optional)
    // "hide" is called when a user clicks on a data-repeater-delete
    // element.  The item is still visible.  "hide" is passed a function
    // as its first argument which will properly remove the item.
    // "hide" allows for a confirmation step, to send a delete request
    // to the server, etc.  If a hide callback is not given the item
    // will be deleted.
    hide: function (deleteElement) {
      if (confirm('Are you sure you want to delete this element?')) {
        $(this).slideUp(deleteElement);
        $(this).remove();

        reIndex();
      }
    },
    // (Optional)
    // Removes the delete button from the first list item,
    // defaults to false.
    isFirstItemUndeletable: true
  });
});