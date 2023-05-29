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

        <div class="mt-5" id="gallery">
            {foreach $contenu_dossier as $photo }
                {if $photo != "." && $photo !=".." }
                {assign var="source" value=$APP_URL|cat:"/gallerie/valide/"|cat:$photo}
                <div class="col gallery-image-wrapper">
                    <img class="gallery-image" src="{$source}" alt="{$photo}">
                </div>
                {/if}
            {/foreach}
        </div>

    </div>

</section>

<!-- Navbar gallerie ( ajout de photos ) -->
<section id="gallery-footer">
    <button id="gallery-add-button" onclick="openModal('gallery-upload-modal')">
        <i class="bi bi-plus-lg text-blue fa-2x"></i>
    </button>
</section>