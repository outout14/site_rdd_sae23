<!-- Modal depot -->
<div class="modal" id="gallery-upload-modal">

    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window p-5" id="gallery-upload-window">
            
            <!-- Fermer -->
            <div class="fixed-top d-flex justify-content-end my-4 mx-5"> 
                <button class="button hover-pointer bg-transparent" onclick="closeModal('gallery-upload-modal')">
                    <i class="bi bi-x fa-2x text-dark"></i>
                </button>
            </div>

            <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
                <form action="{$APP_URL}/home/gallery" method="POST" class="d-flex justify-content-center align-items-center flex-column">
                    <input type="hidden" name="actionType" value="addphotos">
                    <label for="input-file" class="d-flex justify-content-center align-items-center flex-column p-5 mb-3 mt-4 hover-pointer" id="input-file-label">
                        <i class="bi bi-box-arrow-down fa-6x text-secondary mb-4 up-and-down-low"></i>
                        <p class="inscription-info-text mx-3 text-center">Choisissez un fichier à déposer</p>
                    </label>

                    <input type="file" class="button" name="photo" id="input-file">

                    <p class="inscription-info-text my-2 text-center" id="gallery-input-info-text">Chaque photo proposée est soumise à une vérification par les administrateurs avant d'être visible.</p>
                    <input type="submit" value="entrer" name="entrer">
                </form>
            </div>

        </div>
    </div>
</div>