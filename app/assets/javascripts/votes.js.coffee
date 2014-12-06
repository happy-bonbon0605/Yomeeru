# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@count = 0
@error_messages = ['あ、あ、う〜〜〜ん。。おしいんだけどねぇ。なに、忘れちゃったの？', 'ほ、ほんとうにその人でいいの？','あとちょっと...']
@redirect_urls  = ['http://google.com', 'http://www.yahoo.co.jp/','http://yochiyochirb.doorkeeper.jp/']

# select.html.slimに呼び出し処理を追加する after merge #13
@redirectMessagePage = () ->
  votedUserUID = $('button[name="voted_user_id"]:checked').attr('id').replace(/voted_user_/g,'')
  unless isWife(votedUserUID)
    alert(@error_messages[@count])
    window.open(@redirect_urls[@count])
    @count += 1
    if @count > 2
      $('button[name="voted_user_id"]').each ->
        if $(this).attr('id') == 'button#voted_user_0'
          $(this).removeAttr('disabled')
        else
          $(this).hide()
    event.preventDefault()

isWife = (votedUserUID) ->
  if votedUserUID == '0' then true else false
