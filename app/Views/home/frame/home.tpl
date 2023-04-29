<!-- Page d'accueil -->
<section id="startpage-container">
    <div id="startpage-box">
        
        <!-- Titre -->
        <div class="d-flex justify-content-center align-items-center flex-column" id="startpage-title">
            <p class="title-1 ubuntu fw-bold text-orange">GENERATION R&T</p>
            <p class="title-1 ubuntu fw-bold text-bonewhite">REMISE DES DIPLÔMES</p>
            <p class="title-2 ubuntu fw-bold text-orange" id="rdd-date">7 juillet 2023. 19h00</p>
        </div>

        <!-- Compte à rebours -->
        <div class="d-flex justify-content-center align-items-center my-5 px-5 py-3" id="startpage-countdown-box">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">jours</p>
                        <p class="countdown-number ubuntu fw-bold text-bonewhite my-3" id="countdown-days"></p>
                    </div>

                    <div class="col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">heures</p>
                        <p class="countdown-number ubuntu fw-bold text-bonewhite my-3" id="countdown-hours"></p>
                    </div>

                    <div class="col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">minutes</p>
                        <p class="countdown-number ubuntu fw-bold text-bonewhite my-3" id="countdown-minutes"></p>
                    </div>

                    <div class="col-lg-2 countdown-item">
                        <p class="title-3 fw-bold text-bonewhite">secondes</p>
                        <p class="countdown-number ubuntu fw-bold text-bonewhite my-3" id="countdown-seconds"></p>
                    </div>
                </div>

                <div class="row justify-content-center align-items-center mt-3">
                    <div class="col">
                        <p class="title-3 ubuntu fw-bold text-bonewhite text-center">Un évènement à ne pas rater.</p>
                    </div>

                    <!-- Ne doit plus s'afficher lorsqu'on est connectés -->
                    <div class="col-lg-4">
                        <button class="button rounded-pill bg-bonewhite text-blue fw-bold px-3 py-2">
                            <span class="me-2 fw-bold">S'inscrire</span>
                            <img src="{$APP_URL}/assets/images/svg/arrow.svg">
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center align-items-center" id="startpage-arrow-box">
        <img src="{$APP_URL}/assets/images/svg/downarrow.svg" alt="down-arrow" id="startpage-arrow">
    </div>
    
</section>