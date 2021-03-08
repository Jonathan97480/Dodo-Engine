<?php
class conf
{
    /**
     * (FR) si egal 0 on ne débeug pas
     * (EN)if these equals 0 we don't debug
     * 
     * (FR) si egal 1 on active le débeug
     * (EN) if these equal we debug
     */

    static $debug = 1;
    static $admin_prefixe = 'admin';


    /* (FR) variable qui contient les infos pour se connecter à la base de données */
    /* (EN) variable that contains the info to connect to the database */
    static  $databasses = array(

        'default' => array(
            'host' => 'localhost', //(FR) Adresse de la base de donnée (EN)database address
            'database' => 'dodo_engine', //(FR) Nom de la table (EN) Table Name
            'login' => 'root', //(FR)Nom utilisateur (EN)User name
            'password' => '' //Mot de passe de l'utilisateur (EN) user password

        )

    );
}

// (FR)Régle du Router (EN)Rules Router
Router::prefix(conf::$admin_prefixe, 'admin');
Router::connect('', 'systeme/admin_index');
Router::connect(conf::$admin_prefixe, conf::$admin_prefixe . '/systeme/index');
Router::connect('login', 'users/login');
Router::connect('blog', 'posts/index');
Router::connect('blog/*', 'posts/view/*');

Router::connect('portfolio', 'posts/indexProjet');
