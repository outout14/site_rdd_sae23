<!-- Questions -->
<section id="questions-container">

    <div id="questions-box">

        <!-- Titre -->
        <h1 class="title-2 mt-3 mb-lg-4 fw-bold text-bonewhite">
            Vous avez manqué quelque chose?
        </h1>

        <div class="container-fluid">
            <div class="row justify-content-center pb-5">
                <div class="col-12 col-lg-5 me-lg-5">
                    <form action="ERROR" method="POST" id="questions-form">
                        <input type="hidden" name="actionType" value="question">

                        <!-- Les 3 points ( header ), à supprimer sur la version mobile -->
                        <div class="align-items-center mt-3 ms-4 dot-header">
                            <span class="mx-2 dot bg-bonewhite"></span>
                            <span class="mx-2 dot bg-bonewhite"></span>
                            <span class="mx-2 dot bg-bonewhite"></span>            
                        </div>
                        
                        <div class="container mt-0 mt-lg-5">
                            <div class="row pt-3 pb-4 justify-content-around">
                                
                                <!-- Adresse Mail ( obligatoire ) + Submit -->
                                <div class="col-12 col-lg-4 d-flex flex-row flex-lg-column justify-content-between justify-content-lg-center align-items-center gap-3">
                                    <input required type="text" class="ps-2 py-1 m-2 questions-input" placeholder="Adresse e-mail" name="ERROR" id="input-questions-email">
                                    <input type="submit" class="button rounded-pill bg-bonewhite text-darkgrey fw-bold py-2 px-3 mt-0 mt-lg-3" name="ERROR" value="Envoyer"></input>
                                </div>

                                <!-- Texterea -->
                                <div class="col-lg-6 my-2 my-lg-0">
                                    <textarea required class="px-3 py-2 questions-input" id="input-questions-textarea" placeholder="Je me demandais si..."></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-12 col-lg-4 ms-0 ms-lg-5 flex-center">
                    <p class="general-info-text text-justify text-bonewhite">
                        Nous restons bien évidemment disponibles pour répondre à toutes
                        sortes de questions. Si vous rencontrez des problèmes lors de l'utilisation
                        du site, merci de nous en informer via ce formulaire.
                    </p>
                </div>
                
            </div>
        </div>
    </div>

</section>