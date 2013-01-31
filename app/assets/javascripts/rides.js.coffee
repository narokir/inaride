# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Turn forms into wizards with jQury quickWizard plugin
  $('#new_ride').quickWizard
    prevButton : '<button type="button" class="btn btn-large">Previous</button>',
    nextButton : '<button type="button" class="btn btn-large">Next</button>',
    nextArgs : ["slide", { direction: "right" }, 500],
    PrevArgs : ["slide", { direction: "right" }, 500],
    submit : "#post_ride"