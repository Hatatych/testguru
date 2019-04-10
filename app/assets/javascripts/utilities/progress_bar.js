document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.progress-bar')

  if (control) {
    setProgressBarValue(control)
  }
})

function setProgressBarValue(control) {
  var percentage = control.dataset.value
  control.style.width = percentage + '%'
}
