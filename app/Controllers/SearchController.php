<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

function sendUsers($users): void
{
    header('Content-Type: application/json');
    echo json_encode($users);
    exit();
}

class SearchController {
    public function searchAnnuaire(): void
    {
        $data_to_send = array();
        
        $users = User::getAll();

        foreach($users as $user) {
            unset($user->email);
            unset($user->phone_number);
            unset($user->city);
            unset($user->confirmed);
            unset($user->display_in_list);
            unset($user->display_on_map);
            unset($user->family_count);
            unset($user->role);
            unset($user->has_paid);
        }

        $status = "";
        $name = "";
        $promotion = "";
        $company = "";

        if(isset($_POST["status"])){
            $status = $_POST["status"];
        }
        if(isset($_POST["name"])){
            $name = $_POST["name"];
        }
        if(isset($_POST["promotion"])){
            $promotion = $_POST["promotion"];
        }
        if(isset($_POST["company"])){
            $company = $_POST["company"];
        }

        // Si $_POST par défaut, on affiche tous les utilisateurs. Sinon, on fait le traitement.
        if($status == "" && $name == "" && $promotion == "" && $company == "") {
            sendUsers($users);
        } else {
            foreach ($users as $user) {
                // Check status
                if(isset($status) && $user -> status == $status){
                    array_push($data_to_send, $user);
                }
                // Check name
                if(isset($name) && $name != "") {
                    $original_name = strtolower($user->firstname." ".$user->lastname);
                    if(str_contains($original_name, strtolower($name))) {
                        array_push($data_to_send, $user);
                    }
                }

                // Check promotion à revoir
                if(isset($promotion) && $promotion != "") {
                    if($user -> promotion == $promotion){
                        array_push($data_to_send, $user);
                    }
                }

                // Check company
                if(isset($company) && $company != "") {
                    if(str_contains(strtolower($user->company), strtolower($company))) {
                        array_push($data_to_send, $user);
                    }
                }
            }
            sendUsers($data_to_send);
        }
    }
}
