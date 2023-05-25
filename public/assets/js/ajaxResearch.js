const annuaire_body = document.getElementById("annuaire-table-body")

function displayUsers(users) {
    if(users.length == 0) {
        annuaire_body.innerHTML = "<tr><td class='text-center py-5 bg-transparent' colspan='5'>Aucun utilisateur n'a été trouvé</td></tr>";
        return
    }
    annuaire_body.innerHTML = ""
    users.forEach(user => {
        let result = `<tr>
            <td class="ps-0 ps-lg-2 py-3 text-complementary">${user.lastname}</td>
            <td class="ps-0 ps-lg-2 py-3 text-complementary">${user.firstname}</td>
            <td class="ps-0 ps-lg-2 py-3 text-complementary">${user.status}</td>
            <td class="ps-0 ps-lg-2 py-3 text-complementary">${user.promotion}</td>
            <td class="ps-0 ps-lg-2 py-3 text-complementary">${user.company}</td>
        </tr>`
        
        annuaire_body.innerHTML += result
    })
}

function ajaxSend(form) {
    fetch(form.action, {
        method: form.method,
        body: new FormData(form)
    })
        .then(response => response.json())
        .then(data => {
            displayUsers(data);
        })
}

const form = document.getElementById("annuaire-form")
const inputs = document.querySelectorAll(".annuaire-ajax")
const _status = document.getElementById("annuaire-status")
const _name = document.getElementById("annuaire-name")
const _promotion = document.getElementById("annuaire-promotion")
const _company = document.getElementById("annuaire-company")

inputs.forEach( input => {
    input.addEventListener("change", () => {
        // console.log(`Critères de recherche -> Statut: ${status}, Nom : ${name}, Promotion : ${promotion}, Company : ${company}, `)
        ajaxSend(form)
    })
})

ajaxSend(form)

