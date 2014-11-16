# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@redirectMessagePage = () ->
  # TODO ラジオボタンではなくなっているからデータの取得方法を変更する
  votedUserId = $('input[name="vote[voted_user_id]"]:checked').val()
  unless isWife(votedUserId)
    event.preventDefault()
    return

isWife = (votedUserId) ->
  if votedUserId == '0' then true else false
