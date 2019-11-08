json.comment  safe_join(@comment.comment.split("\n"),tag(:br))
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.user_image @comment.user.my_image.url
json.time @comment.created_at.strftime('%Y/%m/%d %H:%M')
