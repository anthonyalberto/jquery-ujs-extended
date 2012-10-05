$ ->
  ajaxSelectors = (attribute) ->
    "input[#{attribute}], a[#{attribute}], form[#{attribute}], textarea[#{attribute}], select[#{attribute}]"

  #Ugly ... there must be a better way to do it ...
  updateNumberField = (element, min_value, value) ->
    if(!isNaN(min_value) && ((value < min_value) || isNaN(value)))
      element.val(min_value)
    else if isNaN(min_value) && !isNaN(value)
      element.val(value)
    else if isNaN(value)
      element.val('')
    else
      element.val(value)


  $(document).on 'ajax:success', ajaxSelectors('data-update'), (evt, data) ->
    $($(@).data 'update').html(data)

  $(document).on 'ajax:success', ajaxSelectors('data-destroy'), (evt, data) ->
    $($(@).data 'destroy').remove()

  $(document).on 'ajax:success', ajaxSelectors('data-append'), (evt, data) ->
    $($(@).data 'append').append(data)

  $(document).on 'ajax:before', ajaxSelectors('data-loader'), (evt, data) ->
    $($(@).data 'loader').show()

  $(document).on 'ajax:complete', ajaxSelectors('data-loader'), (evt, data) ->
    $($(@).data 'loader').hide()

  $(document).on 'ajax:success', ajaxSelectors('data-redirect'), (evt, data) ->
    window.location.replace($(@).data 'redirect')

  $(document).on 'change', ajaxSelectors('data-integer'), (evt, data) ->
    min_value = parseInt($(@).data('integer'))
    value = parseInt($(@).val())
    updateNumberField($(@), min_value, value)

  $(document).on 'change', ajaxSelectors('data-float'), (evt, data) ->
    min_value = parseFloat($(@).data('float'))
    
    value = parseFloat($(@).val())
    updateNumberField($(@), min_value, value)

