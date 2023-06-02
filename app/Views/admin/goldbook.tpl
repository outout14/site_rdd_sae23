{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <h1>Bonjour {$sessionUser->firstname} {$sessionUser->lastname}</h1>
  <p>Bienvenue sur la partie livre d'or, vous pouvez ici gérer les entrées du livre d'or.</p>
  <hr>

  {foreach $goldbook as $message}
  <div class="border m-2 p-2">
    <div class="">{$message->author->lastname} {$message->author->firstname}</div>
    <div class="">
      {$message->content}
    </div>
    <div class="">{$message->date}</div>
    <div class="">{$message->id}</div>

    <a href="{$APP_URL}/admin/goldbook/?validate={$message->id}">Valider</a>
    <a href="{$APP_URL}/admin/goldbook/?nonvalidate={$message->id}">Supprimer</a>     
  </div>
  
  {/foreach}

</div>
{include file="./frame/footer.tpl"}
