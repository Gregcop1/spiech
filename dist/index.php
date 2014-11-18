
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sandrine Piechota | Ostéopathe</title>
    <link rel="stylesheet" href="assets/css/jquery.fancybox.css" media="all" />
    <link rel="stylesheet" href="assets/css/main.css" media="all" />

    <script type="text/javascript"> if(navigator.appName.indexOf("Internet Explorer")!=-1) { document.documentElement.className = 'ie' } </script>
    <script src="assets/js/components/modernizr.js"></script>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
  </head>
  <body class="home">

    

<!--div class="preloader"></div-->
<div id="header" class="header">
  <h1 class="logo"><a href="/"><img src="assets/img/logo.png" width="76" height="83" alt="Sandrine Piechota"/><span class="baseline"><span class="mini">Sandrine Piechota</span>Ostéopathe</span></a></h1>
  <div class="menu">
    <ul  id="mainNav" class="nav mainNav">
      <li></li>
      
        <li class="item-0"><a href="/#osteopathie"><span class="mini">Qu&#x27;est-ce que l&#x27;</span>Ostéopathie</a></li>
      
        <li class="item-1"><a href="/#deroulement"><span class="mini">Déroulement d&#x27;</span>une séance</a></li>
      
        <li class="item-2"><a href="/#formation"><span class="mini">Ma</span>formation</a></li>
      
        <li class="item-3"><a href="/#contact"><span class="mini">Me</span>contacter</a></li>
      
    </ul>
  </div>
</div>

    
<div id="slices" class="slices">
  <div id="index" class="slice slice-1 future">
    <div class="column column-50 column-left"></div>
    <div class="column column-50 column-right"></div>
    <div class="arrowDown">d</div>
  </div>
  <div id="osteopathie" class="slice slice-2 future">
    <div class="column column-50 column-left">
      <div class="bloc">
        <h2>Qu'est-ce que l'ostéopathie ?</h2>
        <p>L'ostéopathie consiste en une méthode de soins manuels déterminant et traitant les restrictions de mobilité du corps humain. Son concept repose sur la globalité du patient.</p>
        <p>Connue pour le mal de dos, elle traite également les migraines, troubles digestifs, vertiges, tendinites, entorses etc. allant du nourrisson à la personne âgée. Différentes techniques existent : crâniennes, articulaires et viscérales.</p>
      </div>
    </div>
    <div class="column column-50 column-right"></div>
  </div>
  <div id="deroulement" class="slice slice-3 future">
    <div class="column column-50 column-left">
      <div class="bloc">
        <h2>Déroulement d'une séance</h2>
        <p>Une séance dure en moyenne 45 minutes et se décompose en un interrogatoire reprenant l'historique du motif de consultation, un examen clinique et le traitement.</p>
        <p>Le montant de la consultation est de 50€ et 45€ chez les enfants de moins de 3 ans. Il n'y a aucune prise en charge de la sécurité sociale mais un grand nombre de mutuelles propose un remboursement forfaitaire à l'année.</p>
      </div>
    </div>
    <div class="column column-50 column-right"></div>
  </div>
  <div id="formation" class="slice slice-4 future">
    <div class="column column-50 column-left"></div>
    <div class="column column-50 column-right">
      <div class="bloc">
        <h2>Ma formation</h2>
        <p>Je suis diplômée de l'Institut Supérieur d'Ostéopathie de Lille (formation continue sur 5 ans). J'ai également suivi une formation supplémentaire en ostéopathie pédiatrique sur Paris pour approfondir mes connaissances sur les nourrissons, enfants, adolescents et femmes enceintes.</p>
        <p>J'ai débuté mon activité par des remplacements que je continue en parallèle du cabinet sur Carvin. J'effectue également des vacations à Auchy les Mines dans un cabinet de sages femmes.</p>
      </div>
    </div>
  </div>
  <div id="contact" class="slice slice-5 future">
    <div class="column column-50 column-left"></div>
    <div class="column column-50 column-right">
      <div class="bloc columns columns-50-50">
        <div class="column column-50">
          <h2>Me contacter</h2>
          <form action="/#contact" enctype="multipart/form-data" method="POST">
            <?php
              foreach($_POST as $k=>$v) {
               $_POST[$k] = htmlspecialchars(trim($v)); 
              }
              if(isset($_POST['firstname']) && $_POST['firstname']=='' && $_POST['name']!='' && $_POST['email']!='' && $_POST['message']!='') {
                // envoi de mail
                echo '<p>Votre message a été transféré avec succès. Je reviens vers vous au plus vite.</p>'
              }
            ?>
            <input type="text" name="firstname" class="firstname"/>
            <input type="text" name="name" required="1" placeholder="Nom"/>
            <input type="email" name="email" required="1" placeholder="Email"/>
            <textarea name="message" required="1" placeholder="Message"></textarea>
            <input type="submit" name="submit" value="Envoyer"/>
          </form>
        </div><!--
        --><div class="column column-50">
          <address>
            Sandrine PIECHOTA<br />
            161, rue Florent Evrard<br />
            62220 CARVIN<br />
            Tél. : 06 78 32 55 31
          </address>
          <p>
            <span class="under">Horaire d'ouverture :</span><br />
            les lundi, mardi, mercredi et vendredi<br />
            de 8h à 20h sur rendez-vous<br />
            le samedi de 9h à 13h sur rendez-vous.
          </p>
          <p>
            <span class="under">Fermeture :</span><br />
            les jeudi et dimanche toute la journée.
          </p>
        </div>

        <div id="GMap" class="gmap"></div>
      </div>

    </div>
  </div>
</div>


    
      <script src="assets/js/components/jquery.min.js"></script>
      <script src="assets/js/components/jquery.mousewheel.js"></script>
      <script src="assets/js/components/jquery.touchSwipe.min.js"></script>
      <script src="assets/js/components/underscore.js"></script>
      <script src="assets/js/components/jquery.fancybox.pack.js"></script>
      <script src="assets/js/components/jquery.fancybox-media.js"></script>
      <script src="assets/js/base.js"></script>
      <script src="assets/js/main.js"></script>
    
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb7X0w6bvwuXXqQ282CTv1Pr-__UnXl_w&amp;sensor=true"></script>
<script src="assets/js/SliceManager.js"></script>
<script src="assets/js/home.js"></script>

  </body>
</html>
