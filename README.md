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
* data-ajax-loader. Takes a DOM element. Will show the DOM element before sending the request, and hide it when the request is completed. This is best used to show a spinner image during a request.
* data-ajax-freeze. Freezes the whole page by placing a transparent element on top of the DOM body. Takes a DOM element ID that will serve as the loader/spinner displayed in the middle of the viewPort.
* data-ajax-redirect. Takes a url. Redirects to the url on ajax success.

For all the above, DOM elements should be passed like this :
* ID : `data: {ajax: {update: 'dom_id'}}` or `data: {ajax: {update: '#dom_id'}}` or `data: {ajax: {update: :dom_id}}`
* Class : `data: {ajax: {update: '.dom_class'}}`


###Behavior
* data-integer. If specified and applied to a text field, will prevent the field from being anything but an integer.Optional value: minimum quantity.


###Animations?
Version 2. Might be interesting to add support for jQuery standard animations aka Fade In etc ...


