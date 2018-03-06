$(document).on('turbolinks:load', () => {
  const copyButton = document.getElementById('copy_url_btn')
  if (copyButton) {
    console.log('triggered')
    const copyText = document.getElementById('url_link')
    copyButton.onclick = () => {
      copyText.select()
      document.execCommand('Copy')
    }
  }
})
