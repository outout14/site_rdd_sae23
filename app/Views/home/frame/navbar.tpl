<!-- Header -->
<header class="d-flex justify-content-between align-items-center fixed-top mt-3 px-5">

    <div class="d-flex justify-content-center align-content-center gap-4">
        <a href="{$APP_URL}/home/" class="header-link header-link-active"><span class="ubuntu">Accueil</span></a>
        <a href="" class="header-link"><span class="ubuntu">Organisation</span></a>
        <a href="{$APP_URL}/home/inscription/" class="header-link"><span class="ubuntu">Inscription</span></a>
        <a href="" class="header-link"><span class="ubuntu">Gallerie</span></a>
        <a href="" class="header-link"><span class="ubuntu">Livre d'or</span></a>
        <a href="" class="header-link"><span class="ubuntu">Administration</span></a>
    </div>

    <!-- Bouton de connexion / Espace personnel -->
    <div class="d-flex justify-content-center align-items-center" id="header-button-wrapper">
        <div id="header-dropdown-wrapper">
            <button class="button bg-bonewhite text-dark fw-bold p-2 px-lg-3 py-lg-2 d-flex justify-content-center align-items-center" onclick="openModal()" id="header-profile-button">
                <span class="me-0 me-lg-2 phone-d-none">Ziuzin Nikita</span>
                <img src="{$APP_URL}/assets/images/svg/person.svg"></img>
            </button>

            <div id="header-dropdown">
                <button class="header-dropdown-element mt-4 mb-1" onclick="console.log('check')">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Mon profil</span>
                    <i class="bi bi-gear text-dark" id="header-dropdown-icon-gear"></i>
                </button>
                <button class="header-dropdown-element mt-3 mb-2" onclick="console.log('check')">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Déconnexion</span>
                    <div>
                        <i class="bi bi-power text-dark"></i>
                    </div>
                </button>
            </div>

        </button>
    </div>
</header>