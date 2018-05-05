Plugin permettant de mettre à disposition une capture d’écran d’un flux
RTSP (souvent utilisé par des caméras low cost) environ toute les 2
secondes. Cette capture peut ensuite être utilisée par le plugin Camera.

Description 
===========

RTSP 
----

Ce plugin permet de mettre à disposition du plugin Caméra une url vers
une capture d’un flux RTSP.

Le pugin Caméra ne gère plus le protocol RTSP par soucis de stabilité et
surtout de charge de votre Jeedom.

Le plugin RTSP vient palier se manque en proposant une alternative peu
consommatrice de ressource mais avec un résultat dégradé. En effet, les
captures sont réalisées toutes les \~2/3 secondes environ et stockées en
mémoire pendant \~2/3 secondes.

Le plugin se base sur la commande avconv fournie par la plupart des
distributions GNU/Linux dont Debian sur laquelle repose Jeedom.

Ce plugin ne remplace en rien le plugin Camera, vous devez une fois le
Flux RTSP créé, copier/coller l’URL de Capture dans un équipement Camera
afin que celle-ci soit visible dans Jeedom.

Configuration 
=============

Plugin configuration
=======================

Après téléchargement du plugin, il vous faudra simplement activer le
plugin :

![RTSP Plugin Installation](../images/RTSP_Plugin_Installation.png)

Equipment configuration
=============================

La configuration des équipements RTSP est accessible à partir du menu
plugin :

![RTSP Menu](../images/RTSP_Menu.png)

Voilà à quoi ressemble la page du plugin RTSP (ici avec déjà 1
équipements) :

![RTSP MesFlux](../images/RTSP_MesFlux.png)

> **Tip**
>
> Comme à beaucoup d’endroits sur Jeedom, placer la souris tout à gauche
> permet de faire apparaître un menu d’accès rapide (vous pouvez, à
> partir de votre profil, le laisser toujours visible).

Une fois que vous cliquez sur l’un d’eux, vous obtenez :

![RTSP Configuration
Equipement](../images/RTSP_Configuration_Equipement.png)

You can find here the full configuration of your device :

-   **Nom de l’équipement RTSP** : nom de votre flux RTSP,

-   **Parent Object**: Specifies the parent object to which belongs
    equipment,

-   **Category**: categories of equipment (it may belong to
    plusieurs catégories),

-   **Enable**: makes your equipment active

Vous retrouvez ici le paramètrage du flux RTSP de votre caméra :

-   **Adresse IP** : ip de votre flux RTSP

-   **Port** : port de votre flux RTSP, par exemple : 554

-   **Nom de la caméra** : nom du service associé à la capture de votre
    flux RTSP

-   **Résolution** : résolution de votre flux RTSP, par exemple :
    1280x720

-   **Complément url (/chemin)** : url du flux, par exemple :
    /ch1\_0.h264

Vous retrouvez ici les paramètres optionnels du flux RTSP de votre
caméra :

-   **Délai** : délai entre 2 captures de votre flux RTSP

-   **Emplacement des captures** : répertoire de sauvegarde de vos
    captures /tmp par défaut, il est conseillé de ne pas modifier cette
    option, sauf si /tmp n’est pas en ram (Voir la section dédiée
    plus bas)

-   **Nom d’utilisateur** : utilisateur pour vous connecter à votre
    caméra (peut être vide)

-   **Mot de passe** : mot de passe pour vous connecter à votre caméra
    (peut être vide)

Vous retrouvez ici le résultat du fichier à ajouter à votre équipement
dans le plugin Camera :

-   **URL de capture (pour le plugin camera)** : URL (en lecture seule)
    à fournir au plugin Camera, par exemple : snapshot\_xiaoyi1.jpg :

![RTSP Camera](../images/RTSP_Camera.png)

Vous retrouvez ici la capture réalisée au moment où vous cliquez afin de
tester votre configuration :

-   \*Aperçu de la capture : Aperçu de la capture réalisée sur ce flux
    RTSP

-   \*Rafraîchir : Action de rafraichissement de la capture de ce flux
    RTSP

-   \*Status : Retour d’état du service RTSP pour ce flux

> **Note**
>
> Pour le moment Il n’y a aucune commande

FAQ
===

Non, le plugin utilise une commande peu gourmande en ressource, pour
celà une capture toute les 2 secondes environ est un bon compromis.

Par défaut, les captures sont faites sur /tmp qui est monté en ram, ceci
permet de ne pas user prématurément votre carteSD. Si ce n’est pas le
cas chez vous (première Mini+ ou DIY). Voici un tutorial pour monter un
dossier en RAM : Nous allons creer un point de montage sur /mnt/rtsp.

Il faut créer le dossier :

`sudo mkdir /mnt/rtsp`

Puis il faut changer les droits :

`sudo chmod 777 /mnt/rtsp`

Enfin un tmpfs se monte comme tous les points de montage sous linux,
avec la commande `mount` :

`sudo mount -t tmpfs -o size=16M tmpfs /mnt/rtsp`

Pour le monter automatiquement au démarrage il faut éditer le fichier
/etc/fstab et rajouter :

Exemple de ligne à rajouter:

`tmpfs /mnt/rtsp tmpfs defaults,size=16m 0 0`

Enfin, n’oubliez pas de spécifier /mnt/rtsp dans le plugin RTSP !

Ce plugin est gratuit pour que chacun puisse en profiter simplement. Si
vous souhaitez tout de même faire un don au développeur du plugin.

Troubleshoting 
==============

Vérifier si l’url http(s)://votrenomdedomaine/snapshot\_test.jpg affiche
une image. Si vous faites F5, celle-ci se raffraichit-elle ? Si oui Le
problème vient du plugin Caméra. Sinon, exposez votre problème sur le
forum.

Vérifier si l’url http(s)://votrenomdedomaine/snapshot\_test.jpg affiche
une image. Si vous faites F5, celle-ci se raffraichit-elle ? Si oui Le
problème ne vient pas du plugin RTSP. Sinon, exposez votre problème sur
le forum.

Se connecter en SSH et vérifier les commandes suivantes : sudo service
rtsp-service-{nomdevotreflusRTSP} status. Puis : sudo service
rtsp-service-{nomdevotreflusRTSP} restart selon le résultat.

Compatibilité 
=============

Caméras compatibles 
-------------------

Vous avez maintenant une documentation d’assistance sur l’équipement,
cette documentation ouverte vous permettra de trouver l’url, le port
ainsi que le protocole utilisé par votre caméra :

![RTSP Assistant Camera](../images/RTSP_Assistant_Camera.png)

3S IP camera 
------------

+--------------------+--------------------+--------------------+--------------------+
| Brand              | Models             | Example URL        | Audio              |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | Unknown            | rtsp://IPADDRESS/c | Possible           |
|                    |                    | a\[CHANNEL\]/h264  |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | N8072\             | [CHANNEL](http://I | No                 |
|                    |                    | PADDRESS/iage/).jp |                    |
|                    |                    | g                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | N8072\             | <http://IPADDRESS/ | No                 |
|                    |                    | axis-cgi/jpg/video |                    |
|                    |                    | .cgi>              |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | N8072\             | rtsp://IPADDRESS:5 | Yes                |
|                    |                    | 54/ca\[CHANNEL\]/h |                    |
|                    |                    | 264                |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | rtsp://IPADDRESS/c | Possible           |
|                    |                    | a1/peg4            |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | rtsp://IPADDRESS/c | Possible           |
|                    |                    | a2/peg4            |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | rtsp://IPADDRESS/c | Possible           |
|                    |                    | a3/peg4            |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | rtsp://IPADDRESS/c | Possible           |
|                    |                    | a4/peg4            |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | [USERNAME](http:// | Yes                |
|                    |                    | IPADDRESS/videostr |                    |
|                    |                    | ea.asf?user=)&pwd= |                    |
|                    |                    | \[PASSWORD\]&resol |                    |
|                    |                    | ution=\[WIDTH\]\*\ |                    |
|                    |                    | [HEIGHT\]          |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | <http://IPADDRESS/ | No                 |
|                    |                    | iage.jpg>          |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | [CHANNEL](http://I | No                 |
|                    |                    | PADDRESS/current). |                    |
|                    |                    | jpg                |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | <http://IPADDRESS/ | No                 |
|                    |                    | cgi-bin/video.jpg> |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | <http://IPADDRESS/ | No                 |
|                    |                    | axis-cgi/jpg/video |                    |
|                    |                    | .cgi>              |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | <http://IPADDRESS/ | No                 |
|                    |                    | videofeed>         |                    |
+--------------------+--------------------+--------------------+--------------------+
| 3S                 | other\             | rtsp://IPADDRESS:5 | Yes                |
|                    |                    | 54/ca\[CHANNEL\]/h |                    |
|                    |                    | 264                |                    |
+--------------------+--------------------+--------------------+--------------------+

Connecting to your cheapo IP camera 
-----------------------------------

+-------------+------------+------------+------------+------------+------------+------------+
| Models      | Connection | Example    | Audio      | Talk Model | Cookies    | Flags      |
|             | Type       | URL        |            |            |            |            |
+=============+============+============+============+============+============+============+
| ### only1\  | MJPEG      | **[USERNAM | No         | None       |            |            |
|  {#_only1_a |            | E](http:// |            |            |            |            |
| sciidoc_br} |            | IPADDRESS/ |            |            |            |            |
|             |            | videostrea |            |            |            |            |
|             |            | m.cgi?usr= |            |            |            |            |
|             |            | )&pwd=\[PA |            |            |            |            |
|             |            | SSWORD\]** |            |            |            |            |
+-------------+------------+------------+------------+------------+------------+------------+
| ### Other\  | MJPEG      | **[CHANNEL | No         | None       |            |            |
|  {#_other_a |            | ](http://I |            |            |            |            |
| sciidoc_br} |            | PADDRESS/G |            |            |            |            |
|             |            | etData.cgi |            |            |            |            |
|             |            | ?CH=)&Code |            |            |            |            |
|             |            | c=jpeg&Siz |            |            |            |            |
|             |            | e=\[WIDTH\ |            |            |            |            |
|             |            | ]x\[HEIGHT |            |            |            |            |
|             |            | \]**       |            |            |            |            |
+-------------+------------+------------+------------+------------+------------+------------+

**FLAGS:**\
FBA = Check Force Basic Authentication\
\
**Note:** URLs for VLC and FFMPEG need to have credentials (your ip
camera login name and password) passed through in the URL like:
rtsp://USERNAME:PASSWORD@IPADDRESS:PORT/…​ ==== Xiaomi Xiaoyi camera

### Stream urls 

Replace 192.168.1.10 with your Xiaoyi Ants ip address\
To enable RTSP you need to flash a firmware with RTSP support or a RTSP
script\
(Note: for hardware version V2.1 you need to use firmware 1.8.5.1K or
higher)\

-   Main stream: rtsp://x.x.x.x:554/ch0\_0.h264

-   Minor stream: rtsp://x.x.x.x:554/ch0\_1.h264

-   Audio stream: rtsp://x.x.x.x:554/ch0\_3.h264

### Firmwares 

-   [1.8.5.1B\_201513211614.zip
    (RTSP support)](http://xiaoyi.querex.be/1.8.5.1B_201513211614.zip)

-   [1.8.5.1F\_2015043018.zip](http://xiaoyi.querex.be/1.8.5.1F_2015043018.zip)

-   [1.8.5.1H\_201505211709.zip](http://xiaoyi.querex.be/1.8.5.1H_201505211709.zip)

-   [1.8.5.1J\_201507201424.zip](http://xiaoyi.querex.be/1.8.5.1J_201507201424.zip)

-   [1.8.5.1J\_easy\_boot.zip (RTSP
    enable script)](http://xiaoyi.querex.be/1.8.5.1J_easy_boot.zip)

-   [1.8.5.1K\_201508311131.rar](http://xiaoyi.querex.be/1.8.5.1K_201508311131.rar)

-   [1.8.5.1K\_test-rtspfix-3.rar (RTSP
    enable script)](http://xiaoyi.querex.be/1.8.5.1K_test-rtspfix-3.rar)

-   [1.8.5.1L\_201506291725.zip](http://xiaoyi.querex.be/1.8.5.1L_201506291725.zip)

-   [1.8.5.1L\_test-rtspfix-3.zip (RTSP
    enable script)](http://xiaoyi.querex.be/1.8.5.1L_test-rtspfix-3.zip)

-   [1.8.5.1M\_201512011815.zip](http://xiaoyi.querex.be/1.8.5.1M_201512011815.zip)

-   [1.8.5.1M\_test-rtspfix-4.zip (RTSP
    enable script)](http://xiaoyi.querex.be/1.8.5.1M_test-rtspfix-4.zip)

-   [1.8.5.1N\_201512212009.zip](http://xiaoyi.querex.be/1.8.5.1N_201512212009.zip)

### How to flash another firmware 

-   Disconnect cam

-   Remove micro SD card

-   Power on and long press reset button

-   Disconnect cam

-   Put \`\`home'' firmware file on SD card

-   Insert micro SD card an power on

-   Wait around 5 min and try to connect from smartphone app

-   Check your cam it’s IP address in the router DHCP list


