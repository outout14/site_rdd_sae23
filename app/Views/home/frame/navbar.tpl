<!-- Header -->
<header class="fixed-top d-flex justify-content-between align-items-center py-1 px-4 mt-2 mt-lg-3">

    <nav class="navbar navbar-expand-lg shadow-0">
        <div class="container-fluid">

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                id="navbar-toggler">
                
                <i class="bi bi-list text-white fa-2x"></i>

            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mt-3 mt-lg-0">

                    {foreach from=$menu key=$key item=$item}
                      <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                          {if $item.name == $currentPage}
                            <a class="nav-link" href="{$item.url}"><span class="header-link ubuntu">{$item.name}</span></a>
                          {else}
                            <a class="nav-link" href="{$item.url}"><span class="header-link ubuntu">{$item.name}</span></a>
                          {/if}
                      </li>
                    {/foreach}

                    {if $sessionUser and $sessionUser->role == "admin"}
                    <li class="nav-item mb-2 mt-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/admin/"><span class="header-link ubuntu">Administration</span></a>
                    </li>
                    {/if}

                </ul>
            </div>

        </div>
    </nav>

    <div class="d-flex justify-content-center" id="header-button-wrapper">
      {if $sessionUser}
        <div id="header-dropdown-wrapper">
            <button class="button bg-bonewhite text-dark fw-bold p-2 px-lg-3 py-lg-2 d-flex justify-content-center align-items-center" id="header-profile-button">
                <span class="me-0 me-lg-2 phone-d-none">{$sessionUser->firstname|capitalize} {$sessionUser->lastname|capitalize}</span>
                <img src="{$APP_URL}/assets/images/svg/person.svg">
            </button>

            <div id="header-dropdown">
                <button class="header-dropdown-element mt-4 mb-1" onclick="console.log('check')">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Mon profil</span>
                    <i class="bi bi-gear text-dark" id="header-dropdown-icon-gear"></i>
                </button>
                <a class="header-dropdown-element mt-3 mb-2" href="{$APP_URL}/auth/logout">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Déconnexion</span>
                    <i class="bi bi-power text-dark"></i>
                </a>
            </div>
        </div>
      {else}
        <button class="button bg-bonewhite text-dark fw-bold p-2 px-lg-3 py-lg-2 d-flex justify-content-center align-items-center" onclick="openModal()" id="header-profile-button">
            <span class="me-0 me-lg-2 phone-d-none">Connexion</span>
            <img src="{$APP_URL}/assets/images/svg/person.svg">
        </button>
      {/if}
    </div>
</header>
