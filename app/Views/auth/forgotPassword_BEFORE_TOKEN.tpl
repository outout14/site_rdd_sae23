{include file="./../home/header.tpl"}
<div class="container mt-5">
  <div>
    <h3>Connexion</h3>
    <form action="#forgotPassword" method="POST">
        {if isset($error)}
          <div class="alert alert-danger" role="alert">
              {$error}
          </div>
        {/if}
      <div class="form-group">
        <label for="email">Adresse email</label>
        <input type="email" class="form-control" id="email" required name="email"  placeholder="Entrez votre adresse email">
      </div>
      <input type="text" name="action" value="forgotPassword" hidden>
      <button type="submit" class="btn btn-primary mt-2">Envoyer</button>
    </form>
  </div>
</div>
{include file="./../home/footer.tpl"}
