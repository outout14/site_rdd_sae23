<header class="fixed-top d-flex justify-content-between align-items-center py-2 px-4">

    <div id="header-background-scroll"></div>

    <nav class="navbar navbar-expand-lg shadow-0">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                id="navbar-toggler">
                
                <i class="bi bi-list text-white fa-2x"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mt-3 mt-lg-0">
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/home/"><span class="link ubuntu">Accueil</span></a>
                    </li>
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="#organisation-container-link"><span class="link ubuntu">Organisation</span></a>
                    </li>
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/home/inscription"><span class="link ubuntu">Inscription</span></a>
                    </li>
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/home/gallerie"><span class="link ubuntu">Gallerie</span></a>
                    </li>
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/home/goldbook"><span class="link ubuntu">Livre d'or</span></a>
                    </li>
                    <li class="nav-item mb-2 mt-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="#"><span class="link ubuntu">Administration</span></a>
                    </li>
                    <li class="nav-item my-1 my-lg-0 mx-2 mx-lg-3">
                        <a class="nav-link" href="{$APP_URL}/home/test"><span class="link ubuntu">Test</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex justify-content-center" id="header-button-wrapper">

        <!-- A afficher lorsque l'utilisateur n'est pas connecté  -->
        <button class="button bg-bonewhite text-dark fw-bold p-2 px-lg-3 py-lg-2 flex-center rounded-pill zIndex" onclick="openModal('connection-modal')">
            <span class="me-0 me-lg-3 phone-d-none">Se connecter</span>
            <i class="bi bi-person-circle text-dark scale"></i>
        </button>

        <!-- A afficher lorsque l'utilisateur est connecté -->
        <div class="ms-3" id="header-dropdown-wrapper">
            <button class="button bg-bonewhite text-dark fw-bold p-2 px-lg-3 py-lg-2 flex-center" id="header-profile-button">
                <span class="me-0 me-lg-2 phone-d-none">Ziuzin Nikita</span>
                <i class="bi bi-person-circle text-dark scale"></i>
            </button>

            <div id="header-dropdown">
                <button class="header-dropdown-element mt-4 mb-1" onclick="console.log('check')">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Mon profil</span>
                    <i class="bi bi-gear text-dark scale" id="header-dropdown-icon-gear"></i>
                </button>
                <button class="header-dropdown-element mt-3 mb-2" onclick="console.log('check')">
                    <span class="text-dark me-0 me-lg-2 phone-d-none">Déconnexion</span>
                    <i class="bi bi-power text-dark scale"></i>
                </button>
            </div>
        </div>
    </div>
</header>