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
    $($(this).data 'update').html(data)

  $(document).on 'ajax:success', ajaxSelectors('data-destroy'), (evt, data) ->
    $($(this).data 'destroy').remove()

  $(document).on 'ajax:success', ajaxSelectors('data-append'), (evt, data) ->
    $($(this).data 'append').append(data)

  $(document).on 'ajax:before', ajaxSelectors('data-loader'), (evt, data) ->
    $($(this).data 'loader').show()

  $(document).on 'ajax:complete', ajaxSelectors('data-loader'), (evt, data) ->
    $($(this).data 'loader').hide()

  $(document).on 'ajax:success', ajaxSelectors('data-redirect'), (evt, data) ->
    window.location.replace($(this).data 'redirect')

  $(document).on 'change', ajaxSelectors('data-integer'), (evt, data) ->
    min_value = parseInt($(this).data('integer'))
    value = parseInt($(this).val())
    updateNumberField($(this), min_value, value)

  $(document).on 'change', ajaxSelectors('data-float'), (evt, data) ->
    min_value = parseFloat($(this).data('float'))
    
    value = parseFloat($(this).val())
    updateNumberField($(this), min_value, value)

  $(document).on 'change', ajaxSelectors('data-url'), (evt, data) ->
    param_name = $(this).data('attribute') || $(this).attr('name')
    method = $(this).data("method") || "get"
    data_params = {method: method}
    data_params[param_name] = $(this).val() if param_name
    element = $(this)

    $.ajax(
      url: $(this).data("url"),
      type: method,
      data: data_params,
      dataType: $(this).data("type"),
      success: (data) ->
        $(element.data 'update').html(data) if element.attr('data-update') != undefined
        $(element.data 'destroy').remove() if element.attr('data-destroy') != undefined
        $(element.data 'append').append(data) if element.attr('data-append') != undefined
        window.location.replace($(element).data 'redirect') if element.attr('data-redirect') != undefined
      ,beforeSend: ->
        $(element.data 'loader').show() if element.attr('data-loader') != undefined

      ,complete: ->
        $(element.data 'loader').hide() if element.attr('data-loader') != undefined
    )



