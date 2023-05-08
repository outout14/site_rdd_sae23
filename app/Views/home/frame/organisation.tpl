<!-- Organisation -->
<section id="organisation-container">

    <div id="organisation-box">

        <!-- Titre -->
        <h1 class="title-2 my-3 fw-bold text-bonewhite">
            Organisation
        </h1>

        <div class="container-fluid">
            
            <!-- Texte d'introduction -->
            <div class="row flex-center">
                <p class="general-info-text text-bonewhite text-justify" id="organisation-text-introduction">
                    {$organisation.introduction}
                </p>
            </div>
            
            <!-- Barre de separation -->
            <div class="separation-bar-lg bg-bonewhite m-auto my-3 my-lg-5 w-75"></div>

            <!-- Frise chronologique -->
            <div class="row flex-center">

                <div class="container-fluid">
                    <div class="row justify-content-start align-items-baseline">

                        <article class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-mortarboard text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>
                                
                                <p class="general-info-text text-bonewhite text-justify" id="organisation-text-timeline-time-1">
                                    {$organisation.timeline_time_1}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="general-info-text-small text-bonewhite text-justify" id="organisation-text-timeline-description-1">
                                {$organisation.timeline_description_1}
                            </p>
                        </article>

                        <article class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-cup-straw text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>

                                <p class="general-info-text text-bonewhite text-justify" id="organisation-text-timeline-time-1">
                                    {$organisation.timeline_time_2}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="general-info-text-small text-bonewhite text-justify" id="organisation-text-timeline-description-1">
                                {$organisation.timeline_description_2}
                            </p>
                        </article>

                        <article class="col-12 col-lg-4 flex-center flex-row gap-3 flex-lg-column gap-lg-0 my-3">
                            <div class="flex-center flex-column">
                                <i class="bi bi-disc text-dark fa-5x rounded-circle bg-bonewhite p-4 mb-2 timeline-icon"></i>
                                
                                <p class="general-info-text text-bonewhite text-justify" id="organisation-text-timeline-time-1">
                                    {$organisation.timeline_time_3}
                                </p>
                            </div>

                            <div class="separation-bar-sm bg-bonewhite my-4 phone-d-none"></div>
                            
                            <p class="general-info-text-small text-bonewhite text-justify" id="organisation-text-timeline-description-1">
                                {$organisation.timeline_description_3}
                            </p>
                        </article>

                    </div>
                </div>
            </div>

            <!-- Barre de separation -->
            <div class="separation-bar-lg bg-bonewhite m-auto my-3 my-lg-5 w-75"></div>

            <!-- Carte + informations -->
            <div class="row flex-center">
                <!-- Adresse -->
                <div class="col-12">
                    <p class="general-info-text text-bonewhite fw-bold text-center" id="organisation-text-address">
                        <i class="bi bi-pin-angle me-3"></i>{$organisation.address}
                    </p>
                </div>
            </div>

            <div class="row flex-center">
                <!-- Carte -->
                <div class="col-12 col-lg-6 my-3 my-lg-5 pe-0 pe-lg-5 flex-center">
                    <div id="organisation-map-wrapper">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6523.773882283416!2d-2.00036324116764!3d48.55396903966604!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480e8611fa6d3a59%3A0x1a2ea39af446494b!2s29%20Rue%20des%20Sources%2C%2022490%20Langrolay-sur-Rance!5e0!3m2!1sfr!2sfr!4v1683188073668!5m2!1sfr!2sfr"
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" id="organisation-map"></iframe>
                    </div>
                </div>
                
                <!-- Informations -->
                <div class="col-12 col-lg-6 px-lg-5 my-3 my-lg-5">
                    <p class="general-info-text text-bonewhite text-justify" id="organisation-text-address-complement-1">
                        {$organisation.complement_1} 
                    </p>

                    <p class="general-info-text text-bonewhite text-justify my-2" id="organisation-text-address-complement-2">
                        {$organisation.complement_2}
                    </p>

                    <p class="general-info-text text-bonewhite text-justify" id="organisation-text-address-complement-3">
                        {$organisation.complement_3}
                    </p>
                </div>
            </div>

        </div>
    </div>

</section>