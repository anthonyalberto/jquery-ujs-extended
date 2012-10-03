jquery-ujs-extended
===================

Extend usage of html5 data attributes of the jquery UJS gem in the context of Ajax calls.

#Work in Progress

These attributes need to be used in conjunction with the data-remote attribute that will be listened by the standard jquery-ujs library.

##Goals
Provide :
###Ajax
* data-update listener that automatically updates the DOM element
* data-destroy listener that automatically deletes the DOM element
* data-append listener that automatically appends to the DOM element
* data-loader. Takes a DOM element. Will show the DOM element before sending the request, and hide it when the request is completed. This is best used to show a spinner image during a request.
* data-redirect. Takes a url. Redirects to the url on ajax success.
* data-url. Applies to form inputs. Calls the url whenever the field has changed. Compatible with data-method and all the above. Specify a data-attribute containing the name of the attribute to send to the server, otherwise will use the 'name' of the field.

For all the above, DOM elements should be passed like this :
* ID : `data: {update: '#dom_id'}`
* Class : `data: {update: '.dom_class'}`
* Chaining : `data: {update: '#dom_id #dom_id2 .dom_class'}`

###Behaviour
* data-integer. If specified and applied to a text field, will prevent the field from being anything but an integer.Value: minimum value. Leave blank if you don't want one.
* data-float. If specified and applied to a text field, will prevent the field from being anything but a float.Value: minimum value. Leave blank if you don't want one.

