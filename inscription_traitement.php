<?php
require_once 'config.php';

    $pseudo = $_POST['pseudo'];
    $email = $_POST['email'];
    $pass = $_POST['password'];
    $password_retype = $_POST['password_retype'];

   
    $rqt = $bdd->prepare('SELECT * FROM Adherents WHERE email = ?');
    $rqtrecup->execute(array($email));    
      
    if($rqtrecup->fetch() != false) {
        echo "Email ou pseudo déjà pris"; 
        exit;
    }
    
        $hash = password_hash($password, PASSWORD_DEFAULT); 
    
        $rqt = "INSERT INTO Adherents(email, pseudo, password) VALUES(:email, :pseudo, :password)";

        $requetePreparee = $connexion->prepare($rqt);
        $requetePreparee->bindParam(':pseudo', $pseudo);
        $requetePreparee->bindParam(':email', $email);
        $requetePreparee->bindParam(':password', $hash);
    
        $requetePreparee->execute();
        
        $nbLignesModifiee = $requetePreparee->rowCount();
        if($nbLignesModifiee != 1) {
            echo "Problème lors de l'enregistrement";
            exit;
        } else {
            echo "Hey $pseudo, tu es maintenant enregistré, et je connais ton adresse (mail)";
        }

    } catch(Exception $e) {
       
        echo $e->getMessage();
    }

