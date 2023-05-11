<section class="flex-center flex-column bg-bonewhite" id="staff-container">

    <!-- <img class="wave" src="{$APP_URL}/assets/images/background/wave-creators-top.svg" alt="wave"> -->

    <!-- Titre -->
    <h1 class="text-title">Organisateurs et sponsors</h1>

    <!-- Organisateurs -->
    <div id="organisator-container">
        <div id="organisator-wrapper-fade"></div>

        <div id="organisator-animation-wrapper">
            {$creators}
        </div>
    </div>

    <!-- Barre de separation -->
    <div class="separation-bar-lg bg-dark"></div>

    <!-- Sponsors -->
    <div class="my-2 my-lg-5 container" id="sponsor-container">
        <div class="row">
            {$sponsors}
        </div>
    </div>

    <!-- <img class="wave" src="{$APP_URL}/assets/images/background/wave-creators-bottom.svg" alt="wave"> -->


</section>