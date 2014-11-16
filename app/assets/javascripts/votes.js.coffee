# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@count = 0
@redirect_urls = ['http://google.com', 'http://www.yahoo.co.jp/','http://yochiyochirb.doorkeeper.jp/']

@redirectMessagePage = () ->
  # TODO ラジオボタンではなくなっているからデータの取得方法を変更する
  votedUserId = $('input[name="vote[voted_user_id]"]:checked').val()
  unless isWife(votedUserId)
    window.open(@redirect_urls[@count])
    @count += 1
    # 奥さん選択可能にする if @count > 2
    event.preventDefault()
    return

isWife = (votedUserId) ->
  if votedUserId == '0' then true else false
