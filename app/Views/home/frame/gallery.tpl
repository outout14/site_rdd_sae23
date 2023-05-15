<section class="window-container background-wave-blue h-100" style="min-height: 100vh;">
    <div class="fixed-top" id="gallery-fade"></div>
    
    <div class="d-flex align-items-center flex-column my-5" id="gallery-wrapper">
        
        <div class="pt-5 flex-center" id="gallery-title">
            <span class="gallery-title-letter">G</span>
            <span class="gallery-title-letter">a</span>
            <span class="gallery-title-letter">l</span>
            <span class="gallery-title-letter">e</span>
            <span class="gallery-title-letter">r</span>
            <span class="gallery-title-letter">i</span>
            <span class="gallery-title-letter">e</span>
        </div>

        <nav class="d-flex justify-content-center align-items-center flex-column flex-lg-row gap-3 mb-5" id="gallery-navigation">
            <a href="#" class="link gallery-navigation-item link-active">Trombinoscopes</a>
            <span class="gallery-navigation-item phone-d-none">|</span>
            <a href="#" class="link gallery-navigation-item">Profeshinal foto by ma elle</a>
            <span class="gallery-navigation-item phone-d-none">|</span>
            <a href="#" class="link gallery-navigation-item">Vos photos</a>
        </nav>

        <div id="gallery">
            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>
            
            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>

            <div class="col gallery-image-wrapper">
                <img class="gallery-image" src="{$APP_URL}/assets/images/gallery/missing.png" alt="">
            </div>
        </div>

    </div>

</section>

<!-- Navbar gallerie ( ajout de photos ) -->
<section id="gallery-footer">
    <button id="gallery-add-button" onclick="openModal('gallery-upload-modal')">
        <i class="bi bi-plus-lg text-blue fa-2x"></i>
    </button>
</section>