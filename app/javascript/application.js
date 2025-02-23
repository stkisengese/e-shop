// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('turbo:load', function() {
  'use strict'
  
  // Form validation
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })

  // Tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  // Auto-dismiss alerts
  const alerts = document.querySelectorAll('.alert')
  alerts.forEach(alert => {
    setTimeout(() => {
      alert.remove()
    }, 4500)

    alert.addEventListener('closed.bs.alert', function () {
      this.remove()
    })
  })
})

// Reset form validation on page change
document.addEventListener('turbo:render', function() {
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.classList.remove('was-validated')
  })
})
