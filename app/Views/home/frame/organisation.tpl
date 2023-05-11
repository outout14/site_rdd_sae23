<img class="wave" src="{$APP_URL}/assets/images/background/wave-organisation.svg" alt="wave">

<a id="organisation-container-link"></a>

<section class="flex-center flex-column bg-darker" id="organisation-container">

    <!-- Titre -->
    <h1 class="text-title text-bonewhite">
        Organisation
    </h1>

    <div class="flex-center flex-column" id="organisation-box">
        <div class="container-fluid">
            <!-- Texte d'introduction -->
            <article class="row flex-center">
                <p class="text-information text-bonewhite" id="organisation-text-introduction">
                    {$organisation.introduction}
                </p>
            </article>
            
            <!-- Barre de separation -->
            <div class="separation-bar-lg bg-bonewhite m-auto my-3 my-lg-5 w-75"></div>

            <!-- Frise chronologique -->
            <article class="row flex-center position-relative">

                <div class="container-fluid" id="organisation-timeline">
                    <div class="row justify-content-start align-items-baseline">
                        <div class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-mortarboard text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>
                                
                                <p class="text-information text-bonewhite text-center mt-2">
                                    {$organisation.timeline_time_1}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="text-complementary text-bonewhite mw-75">
                                {$organisation.timeline_description_1}
                            </p>
                        </div>

                        <div class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-cup-straw text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>

                                <p class="text-information text-bonewhite text-center mt-2">
                                    {$organisation.timeline_time_2}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="text-complementary text-bonewhite mw-75">
                                {$organisation.timeline_description_2}
                            </p>
                        </div>

                        <div class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-disc text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>
                                
                                <p class="text-information text-bonewhite text-center mt-2">
                                    {$organisation.timeline_time_3}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="text-complementary text-bonewhite mw-75">
                                {$organisation.timeline_description_3}
                            </p>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Barre de separation -->
            <div class="separation-bar-lg bg-bonewhite m-auto my-3 my-lg-5 w-75"></div>

            <!-- Carte + Informations complementaires -->
            <article class="row flex-center">
                <!-- Adresse -->
                <div class="col-12">
                    <p class="text-information text-bonewhite fw-bold text-center" id="organisation-text-address">
                        <i class="bi bi-pin-angle me-3"></i>{$organisation.address}
                    </p>
                </div>
                
                <!-- Carte -->
                <div class="col-12 col-lg-6 my-3 my-lg-5 pe-0 pe-lg-5 flex-center">
                    <div id="organisation-map-wrapper">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d119302.93613583162!2d-2.085117716446974!3d48.643383168732996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480e8611fa6d3a59%3A0x1a2ea39af446494b!2s29%20Rue%20des%20Sources%2C%2022490%20Langrolay-sur-Rance!5e0!3m2!1sfr!2sfr!4v1683548902958!5m2!1sfr!2sfr"
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" id="organisation-map"></iframe></div>
                </div>
                
                <!-- Informations -->
                <div class="col-12 col-lg-6 px-lg-5 my-3 my-lg-5">
                    <p class="text-information text-bonewhite" id="organisation-text-address-complement-1">
                        {$organisation.complement_1} 
                    </p>

                    <p class="text-information text-bonewhite my-4" id="organisation-text-address-complement-2">
                        {$organisation.complement_2}
                    </p>

                    <p class="text-information text-bonewhite" id="organisation-text-address-complement-3">
                        {$organisation.complement_3}
                    </p>
                </div>
            </article>
        </div>

    </div>

    <img class="wave" src="{$APP_URL}/assets/images/background/wave-top.svg" alt="wave">

</section>