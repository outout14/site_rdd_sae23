{include file="./../home/header.tpl"}
<div class="container mt-5">
  <div>
    <h3>Enregistrement</h3>
    <form method="post" action="#addUser">
        {if isset($error)}
          <div class="alert alert-danger" role="alert">
              {$error}
          </div>
        {/if}
      <div class="row">
        <div class="col col-3">
          <div class="form-group">
            <label for="nom">Nom</label>
            <input type="text" class="form-control" name="lastname" id="nom" placeholder="Nom" required>
          </div>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="prenom">Prénom</label>
            <input type="text" class="form-control" name="firstname" id="prenom" placeholder="Prénom" required>
          </div>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
          </div>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="password">Mot de passe</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Mot de passe" required>
          </div>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="password">Confirmez le mot de passe</label>
            <input type="password" class="form-control" name="password_confirm" placeholder="Mot de passe" required>
          </div>
        </div>
        <div class="col col-12">
          <hr>
        </div>
        <div class="col col-6">
          <div class="form-group">
            <label for="status">Status</label>
            <select name="status" class="form-control" id="status" required>
              <option value="student">Etudiant</option>
              <option value="teacher">Enseignant</option>
              <option value="oldstudent">Ancien élève</option>
            </select>
          </div>
        </div>
        <div class="col col-12">
          <hr>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="telephone">N° de téléphone</label>
            <input type="tel" class="form-control" name="phone_number" id="telephone" placeholder="0123456789">
          </div>
        </div>
        <div class="col col-3">
          <div class="form-group">
            <label for="telephone">Ville</label>
            <input type="text" class="form-control" name="city" id="city" placeholder="Saint-Malo">
          </div>
        </div>
      </div>
      <div class="col col-6">
        <!-- Checkbox confirmé -->
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="display_on_map" name="display_on_map">
          <label class="form-check-label" for="display_on_map">
            Afficher sur la carte ?
          </label>
        </div>
      </div>
      <input type="text" value="register" name="action" hidden="">
      <button type="submit" class="btn btn-primary mt-2">Ajouter</button>
    </form>
  </div>
</div>
{include file="./../home/footer.tpl"}
