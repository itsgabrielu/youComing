$(document).on('turbolinks:load', function () {
  var copyButton = document.getElementById('copy_url_btn')
  if (copyButton) {
    var copyText = document.getElementById('url_link')
    copyButton.onclick = function () {
      copyText.select()
      document.execCommand('Copy')
    }
  }
})
