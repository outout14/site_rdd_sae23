<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-brand">
      <a class="navbar-brand" href="#">Administration</a>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse align-items-end" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto">
          {foreach from=$menu key=$key item=$item}
            <li class="nav-item">
                {if $item.name == $currentPage}
                  <a class="nav-link active" href="{$item.url}">{$item.name}</a>
                {else}
                  <a class="nav-link" href="{$item.url}">{$item.name}</a>
                {/if}
            </li>
          {/foreach}
          <li class="nav-item">
          <a href="{$APP_URL}/auth/logout" class="nav-link" style="position: absolute; top: 0,5; right: 0;">
            <button style="background-color: #ff5e00; color: white; border: 2px solid; padding: 8px 16px; border-radius: 4px;">Deconnexion </button>
          </a>
        </li>
        <li class="nav-item">
          <a href="{$APP_URL}/home" class="nav-link" style="position: absolute; top: 0; right: 0;">
            <button style="background-color: #000dff; color: white; border: 2px solid; padding: 8px 16px; border-radius: 4px;">Home </button>
          </a>
        </li>
        

        
      </ul>
    </div>
  </div>
</nav>
