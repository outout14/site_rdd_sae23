<form method="post" action="#editJSON" enctype="multipart/form-data">
  <div class="row">
    {foreach from=$donnees_json key=$key item=$item}
      <div class="col col-3">
        <div class="form-group">
          <label for="nom">{$key}</label>
          <input type="text" class="form-control" name="{$key}" id="{$key}" placeholder="{$key}" value="{$item}" required>
        </div>
      </div>
    {/foreach}
    <div class="col col-6">
      <div class="input-group mt-2">
        <label for="photos" class="input-group-text">Photo</label>
        <input type="file" class="form-control" id="photos" name="photos">
      </div>
    </div>
  </div>
  <input type="text" value="{$url_file}" name="file" hidden="">

  <button type="submit" class="btn btn-primary mt-2">Modifier</button>
</form>
