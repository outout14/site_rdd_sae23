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
    <div class="col col-3">
      <div class="form-group">
        <label for="status">Status</label>
        <select name="status" class="form-control" id="status" required>
          <option name="student">Etudiant</option>
          <option name="teacher">Enseignant</option>
          <option name="oldstudent">Ancien élève</option>
          <option name="other">Autre</option>
        </select>
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="promotion">Promotion</label>
        <select name="promotion" class="form-control" id="promotion" required>
          <option value="2AFI">BUT R&T 2 FI</option>
          <option value="2AFA">BUT R&T 2 FA</option>
          <option value="CART">Licence professionnelle CART</option>
          <option value="RIMS">Licence professionnelle RIMS</option>
          <option value="TSSR">Licence professionnelle TSSR</option>
        </select>
      </div>
    </div>

    <div class="col col-3">
      <div class="form-group">
        <label for="promotion_year">Année de diplome</label>
        <select name="promotion_year" class="form-control" id="promotion_year" required>
          <option value="1990">Promotion 1990</option>
          <option value="1990">Promotion 1991</option>
          <option value="1990">Promotion 1992</option>
          <option value="1990">Promotion 1993</option>
          <option value="1990">Promotion 1994</option>
          <option value="1990">Promotion 1995</option>
          <option value="1990">Promotion 1996</option>
          <option value="1990">Promotion 1997</option>
          <option value="1990">Promotion 1997</option>
          <option value="1990">Promotion 1999</option>
          <option value="2000">Promotion 2000</option>
          <option value="2001">Promotion 2001</option>
          <option value="2002">Promotion 2002</option>
          <option value="2003">Promotion 2003</option>
          <option value="2004">Promotion 2004</option>
          <option value="2005">Promotion 2005</option>
          <option value="2006">Promotion 2006</option>
          <option value="2007">Promotion 2007</option>
          <option value="2008">Promotion 2008</option>
          <option value="2009">Promotion 2009</option>
          <option value="2010">Promotion 2010</option>
          <option value="2011">Promotion 2011</option>
          <option value="2012">Promotion 2012</option>
          <option value="2013">Promotion 2013</option>
          <option value="2014">Promotion 2014</option>
          <option value="2015">Promotion 2015</option>
          <option value="2016">Promotion 2016</option>
          <option value="2017">Promotion 2017</option>
          <option value="2018">Promotion 2018</option>
          <option value="2019">Promotion 2019</option>
          <option value="2020">Promotion 2020</option>
          <option value="2021">Promotion 2021</option>
          <option value="2022">Promotion 2022</option>
        </select>
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="role">Rôle</label>
        <select name="role" class="form-control" id="role" required>
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
    <div class="col col-3">
      <div class="form-group">
        <label for="famille">famille</label>
        <select name="family_count" class="form-control" id="famille" required>
          <option name="0">0</option>
          <option name="1">1</option>
          <option name="2">2</option>
          <option name="3">3</option>
          <option name="4">4</option>
          <option name="5">5</option>
        </select>
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="Entreprise">Entreprise</label>
        <input type="text" class="form-control" name="company" id="company" placeholder="Orange">
      </div>
    </div>
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-3">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="display_in_list" value="1" name="display_in_list" checked="">
        <label class="form-check-label" for="display_in_list">
          Afficher sur la liste ?
        </label>
      </div>
    </div>

    <div class="col col-3">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="confirmed" name="confirmed" checked="">
        <label class="form-check-label" for="confirmed">
          Utilisateur confirmé
        </label>
      </div>
    </div>
    <div class="col col-3">
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