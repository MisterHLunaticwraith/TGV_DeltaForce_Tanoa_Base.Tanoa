/*
Template d'intro, décommentez ce dont vous avez besoin.

*/
/////====== Pour lancer un cheminement préenregistré d'un véhicule (voir path.sqf)
///nul = [] execVM "introscript\path.sqf";

////////////========= pour jouer la musique (définie dans sounds.hpp)
////playsound "";


////////=====Pour lancer le texte de générique
///nul= execVM "introscript\credits.sqf";

//////=======bordures noires
//showCinemaBorder true; 

/*
//===prise de vue
///////////cam1/cam2/ cible /dur/foc1/foc2/attach/ x/y/ z /effet   /trans/durtrans
prise1 = [cam1, cam1,target,5, 0.1, 0.1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise1}; 



////======destruction de la camera ne pas editer /// laisser le code ci-dessous à la fin de votre cinématique
_cam = "camera" camCreate (position player);
camDestroy _cam;
player cameraEffect ["terminate","back"];
*/

///////========================================================== description detaillée des params de lancement: POUR INFO, NE PAS DECOMMENTER
/*Detail
prise1 =
 [
 ///position_1_name Cam de depart
 cam, 
 //position_2_name Cam d'arrivee identique si pas de mvment
 cam, 
 //target_name cible
 target, 
 //duration durée en secondes
 10, 
 //zoom_level1 zoom 1 valeurs entre 0.01 et 2,
 0.1, 
 //zoom_level_2 zoom 1 valeurs entre 0.01 et 2, laisser identique en cas de non changement de cam
 0.1, 
 //attached true ou false attaché à l'objet?? (cam1et2 doivent être identiques)
 false, 
 //x_rel_coord
 0, 
 //y_rel_coord
 0, 
 //z_rel_coord
 0,
 //screen_effect "none", "nightvision", "thermal", "blackwhite", "grain", "blur", "wet","chromatic","invert"
 "nightvision",
 //transition_effect "none", "black","white", "blur"//NEPASUTILISE BLACK OU WHITE ==> bugguent
 "blur",
 //transition_duration en secondes
 2,
 //sound_file_name
 "",
 // last_shot true pour la dernière scène false pour les autres
 false] 
execVM "introscript\machinery\cam.sqf";

waitUntil {scriptDone prise1}; 
*/







