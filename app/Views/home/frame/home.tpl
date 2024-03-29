<main id="startpage-container">
    <div class="flex-center flex-column h-100" id="startpage-box">
        <!-- Titre -->
        <div class="flex-center flex-column" id="startpage-title">
            <p class="startpage-title">GENERATION R&T</p>
            <p class="startpage-title">REMISE DES DIPLÔMES</p>
            <p class="startpage-title">7 juillet 2023. 19h00</p>
        </div>

        <!-- Compte à rebours -->
        <div class="flex-center my-5 px-3 px-lg-5 py-3" id="startpage-countdown-box">
            <div class="container-fluid">
                <div class="row justify-content-between">
                    <div class="col-5 col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">jours</p>
                        <p class="countdown-number" id="countdown-days"></p>
                    </div>

                    <div class="col-5 col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">heures</p>
                        <p class="countdown-number" id="countdown-hours"></p>
                    </div>

                    <div class="col-5 col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">minutes</p>
                        <p class="countdown-number" id="countdown-minutes"></p>
                    </div>

                    <div class="col-5 col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">secondes</p>
                        <p class="countdown-number" id="countdown-seconds"></p>
                    </div>
                </div>

                <div class="row justify-content-center align-items-center mt-3">
                    <div class="col-12 col-lg-9">
                        <p class="title-3 ubuntu fw-bold text-bonewhite text-center">Un évènement à ne pas rater.</p>
                    </div>

                    <!-- Ne doit plus s'afficher lorsqu'on est connectés -->
                    {if $sessionUser}
                    <div class="col-12 col-lg-3 d-flex justify-content-center justify-content-lg-start mt-3 mt-lg-0">
                        {if $sessionUser->has_paid == 1}
                          <a href="{$APP_URL}/home/personalspace">
                            <button class="button rounded-pill border border-3 border-white text-bonewhite py-2 px-3 flex-center">
                              <span>Mon profil</span>
                              <i class="bi bi-person-plus fa-lg ms-2"></i>
                            </button>
                          </a>
                        {else}
                            <a href="{$APP_URL}/home/personalspace">   
                                <button class="button rounded-pill border border-3 border-white text-bonewhite py-2 px-3 flex-center">
                                    <span>Tickets</span>
                                    <i class="bi bi-person-plus fa-lg ms-2"></i>
                                </button>
                            </a>
                        {/if}
                    </div>
                    {else}
                        <div class="col-12 col-lg-3 d-flex justify-content-center justify-content-lg-start mt-3 mt-lg-0">
                        <a href="{$APP_URL}/home/register">   
                            <button class="button rounded-pill border border-3 border-white text-bonewhite py-2 px-3 flex-center">
                                <span>S'inscrire</span>
                                <i class="bi bi-person-plus fa-lg ms-2"></i>
                            </button>
                        </a>
                        </div>
                    {/if}
                </div>
            </div>
        </div>

        <div class="flex-center" id="startpage-arrow-box">
            <a href="#organisation-container">
                <img class="up-and-down" src="{$APP_URL}/assets/images/svg/downarrow.svg" alt="down-arrow">
            </a>
        </div>
    </div>
</main>
