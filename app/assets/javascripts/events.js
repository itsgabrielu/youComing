$(document).on('turbolinks:load', function () {
  const copyButton = document.getElementById('copy_url_btn')
  if (copyButton) {
    const copyText = document.getElementById('url_link')
    copyButton.onclick = function () {
      copyText.select()
      document.execCommand('Copy')
    }
  }
})
