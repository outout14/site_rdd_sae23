<form method="post" action="{$APP_URL}/admin/addJson/{$file}" enctype="multipart/form-data">
    <div class="container p-5 mt-5">
        <h4 class="card-title">Ajouter un nouvel élément :</h4>

        {if in_array($smarty.template, ['sponsor.tpl', 'organisator.tpl'])}
        <div class="form-group">
            <label for="inputName">Nom :</label>
            <input type="text" class="form-control" id="inputName" name="name" required>
        </div>
        {/if}

        {if $file == 'organisators.json'}
        <div class="form-group">
            <label for="inputFirstname">Prénom :</label>
            <input type="text" class="form-control" id="inputFirstname" name="firstname" required>
        </div>
        <div class="form-group">
            <label for="inputLastname">Nom :</label>
            <input type="text" class="form-control" id="inputLastname" name="lastname" required>
        </div>
        <div class="form-group">
            <label for="inputTask">Tâche :</label>
            <input type="text" class="form-control" id="inputTask" name="task" required>
        </div>
        {elseif $file == 'organisation.json'}
        <div class="form-group">
            <label for="inputKey">Clé :</label>
            <input type="text" class="form-control" id="inputKey" name="key" required>
        </div>
        <div class="form-group">
            <label for="inputValue">Valeur :</label>
            <input type="text" class="form-control" id="inputValue" name="value" required>
        </div>
        {/if}

        {if $file != 'organisation.json'}
        <div class="form-group">
            <label for="inputLink">Lien :</label>
            <input type="text" class="form-control" id="inputLink" name="link" required>
        </div>
        <div class="form-group">
            <label for="inputPhoto">Photo :</label>
            <input type="file" class="form-control" id="inputPhoto" name="photo">
        </div>
        {/if}

        <button type="submit" class="btn btn-primary">Ajouter</button>
    </div>
</form>