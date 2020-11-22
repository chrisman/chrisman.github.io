document.addEventListener('DOMContentLoaded', e => {
  const body = document.querySelector('body');

  const theme = JSON.parse(localStorage.getItem('theme'));

  theme && Object.keys(theme).forEach(key => {
    body.style.setProperty(key, theme[key]);
  });
});
