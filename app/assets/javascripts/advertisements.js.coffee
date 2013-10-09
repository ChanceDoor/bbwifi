$(document).ready ->
  count = 9
  timer = setInterval ->
    if count < 0
      clearInterval(timer)
      window.opener=null
      window.open('','_self')
      window.close()
    
    $('.count').html(count)
    count--
  , 1000
