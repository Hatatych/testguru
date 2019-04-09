document.addEventListener('turbolinks:load', function() {
  var control1 = document.querySelector('.password-confirmation')
  var control2 = document.querySelector('.password-field')
  if (control1) { control1.addEventListener('input', mismatchAlert) }
  if (control2) { control2.addEventListener('input', mismatchAlert) }
})

function mismatchAlert() {
  var passwordField = document.querySelector('.password-field')
  var passwordConfirmationField = document.querySelector('.password-confirmation')

  if (passwordConfirmationField.value == '') {
    passwordConfirmationField.classList.remove('match')
    passwordConfirmationField.classList.remove('mismatch')
  } else {
    if (passwordConfirmationField.value == passwordField.value) {
      passwordConfirmationField.classList.remove('mismatch')
      passwordConfirmationField.classList.add('match')
    } else {
      passwordConfirmationField.classList.remove('match')
      passwordConfirmationField.classList.add('mismatch')
    }
  }
}
