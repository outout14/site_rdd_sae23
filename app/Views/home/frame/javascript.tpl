<script src="https://js.hcaptcha.com/1/api.js?hl=fr"></script>
{if $currentPage == "Inscription"}
  <script type="text/javascript">
    var c = hcaptcha.render('h-captcha-register');
  </script>
{/if}
<script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
<script src="{$APP_URL}/assets/js/javascript.js"></script>
