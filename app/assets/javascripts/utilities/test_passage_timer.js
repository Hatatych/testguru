document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('deadline')
  var countdownTime = moment.unix(control.dataset.timestamp).unix()


  var x = setInterval(function() {
    var now = moment().unix()
    var distance = countdownTime - now
    control.innerHTML = moment.utc(distance * 1000).format('HH:mm:ss')

    if (distance < 0) {
      clearInterval(x)
      control.innerHTML = "Время истекло!"
      document.getElementById('click_anchor').click()
    }
  }, 1000)
})
