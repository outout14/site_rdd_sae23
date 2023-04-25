<form method="post" action="#addUser">
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
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-6">
      <div class="form-group">
        <label for="status">Status</label>
        <select name="status" class="form-control" id="status" required>
          <option name="student">Etudiant</option>
          <option name="teacher">Enseignant</option>
          <option name="oldstudent">Ancien élève</option>
        </select>
      </div>
    </div>
    <div class="col col-6">
      <div class="form-group">
        <label for="role">Rôle</label>
        <select name="role"  class="form-control" id="role" required>
          <option name="user">Utilisateur</option>
          <option name="admin">Administrateur</option>
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
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-6">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="confirmed" name="confirmed" checked="">
        <label class="form-check-label" for="confirmed">
          Utilisateur confirmé
        </label>
      </div>
    </div>
    <div class="col col-6">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="display_on_map" name="display_on_map" checked="">
        <label class="form-check-label" for="display_on_map">
          Afficher sur la carte ?
        </label>
      </div>
    </div>
  </div>
  <input type="text" value="addUser" name="action" hidden="">
  <button type="submit" class="btn btn-primary mt-2">Ajouter</button>
</form>
