{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <h1>Bonjour {$sessionUser->firstname} {$sessionUser->lastname}</h1>
  <p>Bienvenue sur la partie gallerie, vous pouvez ici les photos de la gallerie.</p>
  <section class="window-container background-wave-blue h-100" style="min-height: 100vh;">
    <div class="fixed-top" id="gallery-fade"></div>
    
    <div class="d-flex align-items-center justify-content-center my-5" id="gallery-wrapper">
        <div class="mt-5 row justify-content-center align-items-center gap-2" id="gallery">
            {foreach $contenu_dossier as $photo }
                {if $photo != "." && $photo !=".." }
                {assign var="source" value=$APP_URL|cat:"/gallerie/non_valide/"|cat:$photo}
                <div class="col-3 gallery-image-wrapper">
                    <img class="gallery-image" src="{$source}" alt="{$photo}">
                    <a href="{$APP_URL}/admin/galery/?validate={$photo}">Valider</a>
                    <a href="{$APP_URL}/admin/galery/?nonvalidate={$photo}">Supprimer</a>                
                  </div>                
                {/if}
            {/foreach}
        </div>
    </div>
</section>

</div>
{include file="./frame/footer.tpl"}


