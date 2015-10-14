callStatus = ->
  url = "#{window.api_url}/status?access_token=#{window.access_token}"
  $.ajax
    type: 'GET'
    url: url
    success: (data, textStatus, jqXHR) ->
      $('#display_block pre').html(JSON.stringify(data, null, 2))
      $('#display_block').fadeIn()

callOrganizationUsers = ->
  url = "#{window.api_url}/organizations/1/users?access_token=#{window.access_token}"
  $.ajax
    type: 'GET'
    url: url
    success: (data, textStatus, jqXHR) ->
      $('#display_block pre').html(JSON.stringify(data, null, 2))
      $('#display_block').fadeIn()


$ ->
  if window.access_token.length > 0
    callOrganizationUsers()
