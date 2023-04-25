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
                {if $item == $currentPage}
                  <a class="nav-link active" aria-current="page" href="{$key}">{$item}</a>
                {else}
                  <a class="nav-link" href="{$key}">{$item}</a>
                {/if}
            </li>
          {/foreach}
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
