$(document).on 'turbolinks:load', ->
  $('#article-tags').tagit
    fieldName:   'category_list'
    singleField: true
  $('#article-tags').tagit()
  category_string = $("#category_hidden").val()
  try
    category_list = category_string.split(',')
    for tag in category_list
      $('#article-tags').tagit 'createTag', tag
  catch error