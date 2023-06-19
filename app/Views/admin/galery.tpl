{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <h1>Gestion de la GALERIE</h1>
  <section class="window-container background-wave-blue h-100" style="min-height: 100vh;">
    <div class="fixed-top" id="gallery-fade"></div>
    
    
    <div class="d-flex align-items-center justify-content-center my-5" id="gallery-wrapper">
    <div class="mt-5 row justify-content-center align-items-center gap-2" id="gallery">
        {foreach $contenu_dossier as $photo}
            {if $photo != "." && $photo != ".."}
                {assign var="source" value=$APP_URL|cat:"/gallerie/non_valide/"|cat:$photo}
                <div class="col-3 gallery-image-wrapper">
                    <div class="card h-100">
                        <img class="card-img-top" src="{$source}" alt="{$photo}" style="height: 200px;">
                        <div class="card-body">
                            <h5 class="card-title">{$photo}</h5>
                            <a href="{$APP_URL}/admin/galery/?validate={$photo}" class="btn btn-success">Valider</a>
                            <a href="{$APP_URL}/admin/galery/?nonvalidate={$photo}" class="btn btn-danger">Supprimer</a>
                        </div>
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>
</div>
</section>
</div>
</div>
</section>
</div>
{include file="./frame/footer.tpl"}


