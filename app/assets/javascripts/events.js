window.onload = () => {
  const copyButton = document.getElementById("copy_url_btn")
  const copyText = document.getElementById('url_link')
  copyButton.onclick = () => {
    copyText.select()
    document.execCommand("Copy")
  }
}
