jquery-ujs-extended
===================

Extend usage of html5 data attributes of the jquery UJS gem in the context of Ajax calls.

#Work in Progress

These attributes need to be used in conjunction with the data-remote attribute that will be listened by the standard jquery-ujs library.

##Goals
Provide :
###Ajax
* data-ajax-update listener that automatically updates the DOM element
* data-ajax-delete listener that automatically deletes the DOM element
* data-ajax-append listener that automatically appends to the DOM element
* Callbacks : data-ajax-success, data-ajax-complete, data-ajax-error, data-ajax-before-send, data-ajax-data-filter take a function name and invoke it when the jQuery events are triggered (see [Jquery Callback functions](http://api.jquery.com/jQuery.ajax/#callback-functions))
* data-ajax-loader. Takes a DOM element. Will show the DOM element before sending the request, and hide it when the request is completed. This is best used to show a spinner image during a request.
* data-ajax-freeze. Freezes the whole page by placing a transparent element on top of the DOM body. Takes an optional element ID
* data-ajax-redirect. Takes a url. Redirects to the url on ajax success.

For all the above, DOM elements should be passed like this :
* ID : `data: {ajax: {update: 'dom_id'}}` or `data: {ajax: {update: '#dom_id'}}` or `data: {ajax: {update: :dom_id}}`
* Class : `data: {ajax: {update: '.dom_class'}}`

For function names for callbacks :
* `data: {ajax: {success: 'functionName'}}


Data callback functions should be like this, for the success listener here:

    function mySuccessCallback (data, textStatus, jqXHR){

    }

With parameters being optional. If you only need the data, create a function with only one parameter.

Parameters are varying depending on the callback, see [Jquery Ajax documentation](http://api.jquery.com/jQuery.ajax/#callback-functions)

###Standard Javascript Listeners
Add data-click support. Takes a function name that will be called every time the element is clicked.

###Animations
Version 2. Might be interesting to add support for jQuery standard animations aka Fade In etc ...

