# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@count = 0
@error_messages = ['あ、あ、う〜〜〜ん。。おしいんだけどねぇ。なに、忘れちゃったの？', 'ほ、ほんとうにその人でいいの？','あとちょっと...']
@redirect_urls = ['http://ja.wikipedia.org/wiki/%E8%AA%8D%E7%9F%A5%E7%97%87', 'http://ja.wikipedia.org/wiki/%E7%B5%90%E5%A9%9A%E8%A9%90%E6%AC%BA', 'http://www.pixiv.net/tags.php?tag=%E6%80%9D%E3%81%84%E7%9B%B4%E3%81%9B%E3%80%81%E9%9B%B0%E5%9B%B2%E6%B0%97%E3%81%AB%E6%B5%81%E3%81%95%E3%82%8C%E3%82%8B%E3%81%AA']

# select.html.slimに呼び出し処理を追加する after merge #13
@redirectOtherPage = () ->
  votedUserUID = $(event.currentTarget).attr('id').replace(/voted_user_/g,'')
  unless isWife(votedUserUID)
    alert(@error_messages[@count])
    window.open(@redirect_urls[@count])
    @count += 1
    if @count > 2
      $('button[name="vote[voted_user_id]"]').each ->
        if $(this).attr('id') == 'voted_user_0'
          $(this).removeAttr('disabled')
        else
          $(this).hide()
    event.preventDefault()

isWife = (votedUserUID) ->
  if votedUserUID == '0' then true else false
