///////////////////////////////////////////// FORMS ///////////////////////////////////////////////////////// 

// Affichage du mot de passe dans le input ( icone d'oeil )

const phone = window.innerWidth < 1000;
const passwordInputIcons = document.querySelectorAll(".password-input-icon");

if(passwordInputIcons != null) {
    passwordInputIcons.forEach(icon => {
        icon.addEventListener("click", () => {
            // Parent of the div
            let parent = icon.closest("div");
    
            console.log("check");
    
            // Child of type input
            let input = parent.querySelector("input");
    
            if (input.type == "text") {
                input.type = "password";
                icon.src = "/images/svg/eyeslash.svg";
            } else {
                input.type = "text";
                icon.src = "/images/svg/eye.svg";
            }
        })
    })
}

// Prend en paremetres un objet de type TypeIt et un string avec le nouveau contenu à afficher dans le typeit
function typeNew(oldTypeIt, newTypeIt, content) {
    oldTypeIt.style.display = "none";
    newTypeIt.style.display = "block";
    
    const connectionTypeIt = new TypeIt(newTypeIt, {
        strings: content,
        speed: 100,
        waitUntilVisible: true,
    }).go();
}

// Compte à rebours

const countdownDate = new Date("Jul 7, 2023 19:00:00").getTime();
const countdownDay = document.getElementById("countdown-days");
const countdownHour = document.getElementById("countdown-hours");
const countdownMinute =  document.getElementById("countdown-minutes");
const countdownSecond =  document.getElementById("countdown-seconds");

function countdown() {
    let currentDate = new Date().getTime();
    
    let difference = countdownDate - currentDate;

    let days = Math.floor(difference / (1000 * 60 * 60 * 24)).toString();
    let hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)).toString();
    let minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)).toString();
    let seconds = Math.floor((difference % (1000 * 60)) / 1000).toString();

    if(days.toString().length === 1 ) {
        days = "0" + days;
    } 
    if(hours.toString().length === 1 ) {
        hours = "0" + hours;
    } 
    if(minutes.toString().length === 1 ) {
        minutes = "0" + minutes;
    } 
    if(seconds.toString().length === 1 ) {
        seconds = "0" + seconds;
    }

    countdownDay.innerHTML = days;
    countdownHour.innerHTML = hours;
    countdownMinute.innerHTML = minutes;
    countdownSecond.innerHTML = seconds;

    setTimeout(countdown, 1000);
}

if(countdownDay != null) {
    countdown();
}

//////////////////////////////////////////////////// CONNECTION ////////////////////////////////////////////////////

// Affichage du formulaire de connexion

function openModal(identifier, source=null) {
    let modal = document.getElementById(identifier);

    if(source != null) {
        console.log(source)
        let image = document.getElementById("gallery-modal-photo");
        image.src = source;
    }

    modal.style.display = "block";
    setTimeout(() => {modal.style.opacity = "1"}, 1);
    document.body.style.overflow = "hidden";
}

function closeModal(identifier) {
    let modal = document.getElementById(identifier);

    if(identifier === "connection-modal") {
        connectionScroll("up");
        document.querySelectorAll(".connection-form").forEach(element => {
            element.reset();
        })

        connectionError("disable");
    }


    modal.style.opacity = "0";
    setTimeout(() => {modal.style.display = "none"}, 750)
    document.body.style.overflow = "auto";
}


// Scroll dans le formulaire de connexion

function connectionScroll(direction) {
    let connectionWindow = document.getElementById("connection-window")
    let passwordWindowHeight = document.getElementById("password-reinitialise").offsetHeight
    
    if(direction === "down") {
        connectionWindow.scrollBy(0, 9999)
        if(!phone) {
            connectionWindow.style.height = `${passwordWindowHeight}px`;
        }
    } else if(direction === "up") {
        connectionWindow.scrollBy(0, -9999)
        if(!phone) {
            connectionWindow.style.height = "75vh";
        }
    }
}

// TypeIt
var connectionTypeIt;
if(document.getElementById("connection-typeit") != null ) {
    connectionTypeIt = new TypeIt("#connection-typeit", {
        strings: "Content de vous revoir!",
        speed: 100,
        waitUntilVisible: true,
    }).go();
}

// Affichage d'erreur lors de la validation du formulaire, prend en parametre un string 
// qui doit être égal à "login" ou "password", selon le type d'erreur. Si rien n'est donné en paramètre,
// affiche un texte d'erreur par défaut
// Disable pour remettre le formualaire à zero ( utilisé dans closeModal() )

var isError = false

function connectionError(type="undefined") {
    let container = document.getElementById("connection-error-container");
    let avatar = document.getElementById("connection-error-img");
    let defaultTypeIt = document.getElementById("connection-typeit");
    let errorTypeIt = document.getElementById("connection-error-typeit");
    let errorText = document.getElementById("connection-error-text");

    
    if(type === "login") {
        errorText.innerText = "Il me semble que je ne connais pas ce login. Êtes-vous sûr que vous avez utilisé la bonne adresse mail?";
    } else if(type === "password") {
        errorText.innerText = "Vous vous êtes trompés de mot de passe. Reessayez.";
    } else if(type === "disable") {
        if(isError) {
            typeNew(errorTypeIt,defaultTypeIt, "Content de vous revoir!");
            avatar.src = "../images/creators/creator_hello.png";
            container.classList.toggle("tada");
            errorText.innerText = "";
        } 
        return
    } else {
        errorText.innerText = "Une erreur se produite lors de votre connexion. Veillez reessayer plus tard.";
    }
    
    isError = true;
    typeNew(defaultTypeIt,errorTypeIt, "Erreur! À l'ed! À l'ed");
    avatar.src = "../images/creators/creator_error.png";
    container.classList.toggle("tada");
}

/////////////////////////////// INSCRIPTION /////////////////////////////////////

// Si on est sur la page de inscription, alors tout ce code est chargé
if(document.getElementById("inscription-container") != null){
    function firstContinue() {
        let div_email = document.getElementById("change-help-email");
        let div_selectPromotion = document.getElementById("change-select-promotion");
        let div_selectOldPromotion = document.getElementById("change-select-oldpromotion");
        let div_inputEntreprise = document.getElementById("change-input-entreprise");
        let div_checkFamily = document.getElementById("change-check-family");
        let div_checkMap = document.getElementById("change-check-map");
        
        switch (statusSelect.value) {
            case "student":            
                div_selectPromotion.style.display = "block";
                div_inputEntreprise.style.display = "block";
                break;
            case "teacher":
                div_email.innerText = "Merci d'utiliser votre mail universitaire ( @univ-rennes1.fr )";
                div_checkFamily.style.display = "none";
                div_checkMap.style.display = "none";
                break;
            case "oldstudent":
                div_email.innerText = "Votre email sera utilisé afin de valider votre inscription";
                div_selectOldPromotion.style.display = "block";
                div_inputEntreprise.style.display = "block";
                div_checkFamily.style.display = "none";
                break;
            case "other":
                div_email.innerText = "Votre email sera utilisé afin de valider votre inscription";
                div_inputEntreprise.style.display = "block";
                div_checkFamily.style.display = "none";
                break;
            }

        // Permet de scroll
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight)
    }

    function inscriptionError(number, text) {
        // Affichage d'erreur
        // Prend en parametres un int number ( entre 0 et 1 ), qui correspond à la partie du formulaire où on se trouve)
        // 0 -> Premiere partie ( nom, prenom, etc... ) | 1 -> Deuxieme partie ( checkbox, mots de passe, etc... )
        // Prend en parametre un str text qui correspond au texte d'erreur
        
        let avatars = document.querySelectorAll(".error-avatar");
        let textBoxes = document.querySelectorAll(".error-text");
        
        avatars[number].parentElement.parentElement.classList.add("data-mdb-toggle='animation'");
        avatars[number].parentElement.parentElement.classList.add("data-mdb-animation-start='onHover'");
        avatars[number].parentElement.parentElement.classList.add("data-mdb-animation-reset='true'");
        avatars[number].parentElement.parentElement.classList.add("data-mdb-animation='tada'");
        
        avatars[number].style.borderColor = "var(--orange-bg)";
        avatars[number].children[0].src = "./images/creator_error.png";
        
        // Texte TypeIT
        textBoxes[number].children[0].innerText = "Oops! Erreur!";
        textBoxes[number].children[0].classList.add("error-font");
        
        // Texte d'erreur
        textBoxes[number].children[1].innerText = "Je crois que vous avez fait une erreur lors de l'inscription. Revoyez les champs entourés en orange afin de finir votre inscription.";
    }

    // Fonction du deuxieme bouton "Continuer" dans le formulaire, permet de s'assurer que tout a été bien rentré ( puis scroll vers
    // la page suivante ) et sinon affiché une erreur.
    function secondContinue() {
        // let lastname = document.getElementById("input-lastname")
        // let firstname = document.getElementById("input-firstname")
        // let email = document.getElementById("input-email")
        // let phone_number = document.getElementById("input-phone_number")
        // let entreprise = document.getElementById("input-entreprise")

        // let errors = []
        // let setBorderTo = []

        // if(lastname.value == "") {
        //     errors.push("Vous n'avez pas entré de nom.")
        //     setBorderTo.push(lastname)
        // } else if(lastname.value.length > 20) {
        //     errors.push("Votre nom est trop long")
        //     setBorderTo.push(lastname)
        // }

        // if(firstname.value == "") {
        //     errors.push("Vous n'avez pas entré de prenom.")
        //     setBorderTo.push(firstname)
        // } else if(lastname.value.length > 20) {
        //     errors.push("Votre prenom est trop long")
        //     setBorderTo.push(firstname)
        // }

        // if(email.value == "") {
        //     errors.push("Vous n'avez pas entré d'email.")
        //     setBorderTo.push(firstname)}
        // // } else if(statusSelect.value == "student") {
        // //     // if(email.value.split('@'))
        // // }

        // setBorderTo.forEach(element => {
        //     element.classList.add("error-border")
        // })

        // Permet de scroll
        inscriptionScrollable.scrollBy(0,inscriptionScrollableHeight);
        
        // Si l'eleve n'est pas en alternance, on ne lui propose pas de choisir la ville    
        if(document.getElementById("input-promotion").value == "2AFI") {
            div_checkMap.style.display = "none";
        }
    }

function submit() {
    let city = document.getElementById("input-city");
    let password = document.getElementById("input-password");
    let confirm_password = document.getElementById("input-confirm_password");
}


    // Variables pour le scroll
    var inscriptionScrollable = document.getElementById("inscription-scrollable");
    const inscriptionScrollableHeight = inscriptionScrollable.offsetHeight;

    // Traitement du premier select ( etudiant / prof / ancien eleve / autre )

    // Fonction du premier bouton "Continuer" dans le formulaire, permet de adapter le formulaire selon le statut choisi ( etudiant, prof, etc.. )
    const statusSelect = document.getElementById("inscription-select");

    // Permet de refresh la page
    const refreshButtons = document.querySelectorAll(".go-up-btn");

    refreshButtons.forEach(button => {
        button.addEventListener("click", () => {
            // inscriptionScrollable.scrollBy(0,-scrollableHeight)
            location.reload();
        })
    })

    // TypeIT "Hello World!", "Parfait!" dans le formulaire d'inscription

    new TypeIt("#inscription-typeit-1", {
        strings: "Hello world!",
        speed: 100,
        waitUntilVisible: true,
    }).go();

    new TypeIt("#inscription-typeit-2", {
        strings: "Parfait! Continuons.",
        speed: 100,
        waitUntilVisible: true,
    }).go();

    new TypeIt("#inscription-typeit-3", {
        strings: "Une dernière étape!",
        speed: 100,
        waitUntilVisible: true,
    }).go();

    // Verification si le checkbox parents est activé. Si oui, le select du nombre de parents s'active
    // et le texte d'aide apparait.
    const parentsCheck = document.getElementById("parentsCheck")
    const parentsSelectCounts = document.getElementById("parentsSelect")
    const parentsHelpText = document.getElementById("parentsHelp")

    parentsCheck.addEventListener("change", () => {
        if (parentsCheck.checked) {
            parentsSelectCounts.disabled = false;
            parentsHelpText.style.opacity = "1";
        } else {
            parentsSelectCounts.disabled = true;
            parentsHelpText.style.opacity = "0";        
        }
    })

    // Verification si le checkbox carte est activé. Si oui, le input de ville s'active

    const MapVisibilityCheck = document.getElementById("MapVisibilityCheck")
    const MapTownInput = document.getElementById("input-city")

    MapVisibilityCheck.addEventListener("change", () => {
        if (MapVisibilityCheck.checked) {
            MapTownInput.disabled = false;
        } else {
            MapTownInput.disabled = true;
        }
    })

    // Vérificiation si l'élève est en alternance ou pas, sinon le input 'entreprise'

    const promotionSelect = document.getElementById("input-promotion")
    const inputEntreprise = document.getElementById("input-entreprise")

    promotionSelect.addEventListener("change", () => {
        if (promotionSelect.value == "2AFI") {
            inputEntreprise.disabled = true;
        } else {
            inputEntreprise.disabled = false;
        }
    })

    // Code pour téléphone -> Changement des options du select de promotion
    // On passe de Licence Professionnelle à LP pour gagner de l'espace

    if (phone) {
        let possibleOptions = ["BUT R&T 2 FI", "BUT R&T 2 FA", "LP CART", "LP RIMS", "LP TSSR"]
        let options = promotionSelect.children

        for(i = 0; i < options.length; i++) {
            options[i].text = possibleOptions[i]
        }
    }
}


/////////////////////////////////// HEADER //////////////////////////////

const navbar = document.querySelector("header")
const navbarToggler = document.getElementById("navbar-toggler")
const headerBackground = document.getElementById("header-background-scroll")

navbarToggler.addEventListener("click", () => {
    navbar.classList.toggle("toggle")

    if(navbar.classList.contains("toggle")) {
        navbar.style.backgroundColor = "var(--blue)";
    } else {
        navbar.style.backgroundColor = "transparent";
    }
})

if(document.documentElement.scrollHeight == window.innerHeight) {
    headerBackground.style.height = "100%";
} else {
    window.addEventListener("scroll", () => {
        if(window.scrollY > 200) {
            headerBackground.style.height = "100%";
        } else {
            headerBackground.style.height = "0%";
        }
    })
}

////////////////////// GALLERIE /////////////////////////////

// Animation lors du chargement de la page ( title wrapper )

function titleAnimation(identifier) {
    let title = document.getElementById(identifier)
    let letters = title.children

    for(let i = 0; i < letters.length; i++) {
        setTimeout( () => {
            letters[i].style.transform = "translateY(0)";
            letters[i].style.opacity = "1";
        }, i*75)
    }   
}


const gallery = document.getElementById("gallery")

if(gallery != null) {
    if(gallery.children.length == 0) {
        gallery.innerHTML = "<span class='inscription-info-text text-white'>Une fois la cérémonie passée, les photos apparaitront ici.</span>"
    }
}

const images = document.querySelectorAll(".gallery-image-wrapper")

if(images != null) {
    images.forEach( image => {
        image.addEventListener("click", () => {
            let photo = image.children[0].src;

            openModal("gallery-modal", photo)
        })
    })
}

/////////////////////////// ORGANISATION ///////////////////////

const timelineIcons = document.querySelectorAll(".timeline-icon")

if(phone && timelineIcons != null) {
    timelineIcons.forEach(icon => {
        icon.classList.toggle("fa-5x");
        icon.classList.toggle("fa-2x");
    })
}