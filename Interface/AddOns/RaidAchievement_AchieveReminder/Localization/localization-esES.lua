﻿if GetLocale() == "esES" then


function iclllocaleui()

	rallachdonel1 = "completado"
	rallachdonel2 = "no completado"
	rallachievekologarnhp1 = "800K - 1 min"
	rallachievekologarnhp2 = "3 min - 4 min"
	rallachiverepl1 = "Logros no completados en"
	rallachiverepl10 = "Lista completa de logros necesitados para 'gloria del héroe/raider' en"
	rallachiverepl11 = "Los logros necesitados para 'gloria del héroe/raider' NO se encuentran en esta zona."
	rallachiverepl12 = "Lista completa de logros por conseguir en"
	rallachiverepl13 = "Logros incompletos para"
	rallachiverepl14 = "Lista de todos los logros para"
	rallachiverepl15 = "No se encontraron logros para el boss actual con las opciones establecidas."
	rallachiverepl16 = "Logros incompletos para 'gloria del héroe/raider'"
	rallachiverepl17 = "Lista completa de logros necesitados para 'gloria del héroe/raider'"
	rallachiverepl18 = "Lista completa de logros incompletos para"
	rallachiverepl19 = "Lista completa de TODOS los logros en"
	rallachiverepl2 = "Has completado todos los logros para esta localización."
	rallachiverepl3 = "La localización actual no es una banda o mazmorra heroica."
	rallachiverepl4 = "Lista de todos los logros en"
	rallachiverepl5 = "El grupo de logros para esta localización no se han encontrado en la base de datos."
	rallachiverepl6 = "Chequeo de logros deshabilitado."
	rallachiverepl7 = "Se han encontrado más de 10 logros (|cff00ff00%s|r). La lista completa está disponible en la ventana de opciones del addon (/rach - Lista por zonas)"
	rallachiverepl8 = "Logros sin completar para 'gloria del héroe/raider' en"
	rallachiverepl9 = "Has completado todos los logros para 'gloria del héroe/raider' pertenecientes a esta zona."
	rallbutton2 = "Elije otra localización"
	rallbutton3 = "<<< Regresar a las opciones"
	rallchatshowboss = "Mostrar en el chat"
	ralldefaulttactic1 = "Hay aproximadamente 85 zombies en toda la calle del principio, así que necesitas:\n1. Matar el 1er boss.2. Arrastra al 2º boss hasta la posada (llevadlo dentro).3. Espera a que pasen 1 o 2 minutos para que resuciten los zombies, entonces matadlo.4. Habla con Arthas, limpia la posada, mata el 3er boss y habla con Arthas de nuevo para que abra el pasaje de la biblioteca.5. 1 o 2 DPS han de volver a donde matásteis al 2º boss, el resto siguen adelante.6. Comenzad a matar zombies de forma simultánea en las 2 localizaciones hasta que salte el logro."
	ralldefaulttactic10 = "El boss comienza a hacer aparecer mocos al 50% y para al 25%. Espera a que los mocos pequeños se transformen en los Lodoferro que necesitas matar."
	ralldefaulttactic11 = "Escarcha Permanente se acumula cada 2 o 3 segundos. Te puedes quitar el efecto escondiéndote detrás de las rocas que lanza el boss o removiéndolas o matando al boss muy deprisa."
	ralldefaulttactic12 = "Has de pasar a través del pasaje helado de antes del 3er boss sin que nadie del grupo reciba NADA de daño de los bloques que caen.\nPuedes saber dónde caeran porque aparece un círculo azul aproximadamente 5 segundos antes de caer."
	ralldefaulttactic13 = "Después de haber limpiado el último callejón ANTES de Mal'ganis, entras en un área que parece no haber sido corrompida por la plaga. Tiene 2 caminos, puedes ir a la derecha a por Mal'ganis O a la izquierda. El Corruptor Infinito está en la IZQUIERDA, si todavía te queda tiempo en el contador."
	ralldefaulttactic14 = "Descripción: Cada 30seg aproximadamente, el boss enfoca a un miembro del grupo y canaliza un hechizo que hace aparecer un Trozo de alma corrupto. Se supone que has de huir lo más lejos posible de él, porque cuando aparecen comienzan a moverse hacia Bronjahm y si le tocan, desaparecen. Cuando la vida del boss baja al 35% se teleporta al centro de la sala y para de moverse.\nTáctica: Kitea al boss alrededor de la plataforma que hay antes de pullearlo, y espera hasta que aparezcan 4 Trozo de alma corrupto, entonces matadlo rápidamente. Los Trozo de alma corrupto deben ser ralentizados."
	ralldefaulttactic15 = "El grupo tiene que hacer una rotación para interrumpir el casteo de \"Explosión Fantasma\"."
	ralldefaulttactic16 = "El boss se hace immune durante 45 segundos una vez en el combate. Espera y mátalo sin destruir las Falla Caótica (cuidado con el daño en área)."
	ralldefaulttactic17 = "Logro individual. Frío Intenso se acumula en los jugadores cada 2 segundos. Con el movimiento se rompe el efecto. Si no te mueves durante más de 5 segundos fallarás el logro. Atención, Keristrasza tiene una habilidad para congelar a los jugadores durante 10 segundos, removedla."
	ralldefaulttactic18 = "Descripción: el segundo boss es aleatorio. Puede ser la Confesora Argenta Cabelloclaro o Eadric el Puro. Cabelloclaro invoca sólo 1 de los 25 recuerdos durante el combate."
	ralldefaulttactic19 = "Descripción: \"Martillo de Justicia\" aturde a un enemigo, haciéndolo vulnerable a \"Martillo del Honrado\" e impidiendo que se mueva o ataque durante 6 segundos.\n\"Martillo del Honrado\" lanza un martillo que golpea a un enemigo causándole 14K de daño Sagrado. SI el objetivo no está afectado por 'Martillo de Justicia',  el martillo puede ser cogido y lanzado de vuelta al que lo tiró.\nTáctica: Bajad el boss hasta los 13K de vida y esperad hasta que aturda a alguien. Removed el aturdimiento y en la barra de acciones del jugador aparecerá un único hechizo 'lanza el martillo de vuelta', ¡usadlo!"
	ralldefaulttactic2 = "Sencillamente permanece en las Escaleras matando todos los adds. Cuando se rompa el escudo de Novos ya no aparecen más adds y podeis atacarle. No necesitais prestar atención a nada más."
	ralldefaulttactic20 = "Mata los necrófagos o kitea al boss si están comenzando a explotar."
	ralldefaulttactic21 = "\"Tumba de Escarcha\" encierra al objetivo en un bloque de hielo. Solamente mata al boss sin romper las tumbas. El boss se la lanza a un jugador aleatorio."
	ralldefaulttactic22 = "Hay 2 Mole de la Plaga cerca del boss, sólo necesitas 1 de ellas para el logro. Al 50% del boss comenzará el 'Ritual de la Espada', debes de matar a la Mole de la Plaga con la explosión de la espada."
	ralldefaulttactic23 = "Para matar a Grauf debes lanzarle 3 arpones usando los 3 lanzaarpones al mismo tiempo."
	ralldefaulttactic24 = "Si no matas rápidamente al boss, se lanzará \"Aterrar\" a sí mismo. No le hagas daño al boss mientras esté bajo este efecto. Simplemente mata al boss rápidamente antes de que se lo lance."
	ralldefaulttactic25 = "Mata los Glóbulos de Ícor rápidamente mientras están intentando unirse con el boss."
	ralldefaulttactic26 = "Los Cristales de Control de Defensa están situados en las paredes. No los acciones y no dejes que los adds dañen el Sello de la Prisión."
	ralldefaulttactic27 = "Cada vez que visites esta mazmorra, encontrarás sólo 2 de los 6 bosses que existen."
	ralldefaulttactic28 = "si el Guardián Ahn'kahar está cerca del boss, éste se hace immune a todo el daño. Simplemente llévate al add y mata al boss rápidamente."
	ralldefaulttactic29 = "Bjarngrim tiene 3 plataformas donde se para y obtiene Carga eléctrica temporal. Atácale mientras tenga la Carga eléctrica temporal activa."
	ralldefaulttactic3 = "Descripción: a veces el boss daña a los enemigos a menos de 50 yardas. Por cada enemigo dañado de esta manera el boss gana 1 acumulación de "Consumir".\nTáctica: Mata rápidamente al boss."
	ralldefaulttactic30 = "Algunas veces el boss golpea el Yunque de Volkhan, creando 2 Gólem Fundido. Mata el boss antes de que fabrique más de 4 gólems."
	ralldefaulttactic31 = "En la segunda gase (volando), Onyxia lanzará Aliento Profundo en la dirección que esté mirando (pasa en diagonal a través de la sala). Si la haceis bajar rápidamente, no podrá lanzar este hechizo."
	ralldefaulttactic32 = "Al 65%, Onyxia entra en la segunda fase. Cuando deje el suelo tienes 10 segundos para correr por dentro de las cuevas para forzar la aparición de las crías."
	ralldefaulttactic33 = "Gormok el Empalador lanza snobolds a los jugadores. No les mateis los %s, y matad a Aullahielo en la última fase del encuentro."
	ralldefaulttactic34 = "Cuando el boss llega al 35% no se volverá a sumerger y ya no saldrán Escarabajos de Enjambre. Espera hasta que tengas la cantidad necesaria de ellos y mátalos a todos de golpe."
	ralldefaulttactic35 = "Logro individual. Has de evitar Golpe de Lava, NO el muro de llamas. El Golpe de Lava es un daño de área que te selecciona, ¡fíjate! O muere al comienzo del combate y conseguirás el logro. ;)"
	ralldefaulttactic36 = "Durante la fase 2 (después de que el boss alcance el 50%) habrán varios Sucesor de la Eternidad. Cuando muera uno de ellos deja un disco en el suelo en el que necesitas montarte y matar con un golpe de gracia a uno de los Sucesor de la Eternidad."
	ralldefaulttactic37 = "Hay dos maneras de conseguir el logro: 1. No mates los adds 2. Mata los ads muy lejos del boss"
	ralldefaulttactic38 = "Descripción: Thaddius castea \"Cambio de Polaridad\" lo que coloca una Carga Negativa o una Carga Positiva a cualquiera de los enemigos cercanos (perjuicio). Los jugadores junto a otros con el mismo tipo de Carga incrementan el daño realizado. Los jugadores junto a otros con la Carga opuesta dañan a los miembros de la banda cercanos y provocan el FALLO del logro.\nTáctica: Divide la banda en 2 áreas (+ y -). Después de cada Cambio de Polaridad corre al área que te corresponda dependiendo de tu nueva Carga."
	ralldefaulttactic39 = "En la primera fase tienes que derrotar los adds de Kel'Thuzad, ataca a las abominaciones y mata la cantidad necesaria de ellas."
	ralldefaulttactic4 = "Mata la cantidad necesaria de dinosaurios durante el combate contra el boss."
	ralldefaulttactic40 = "Durante el combate con el boss lanzará Cementerio de Púas Osarias a los jugadores (1 en 10 y 3 en 25). Las púas se han de matar muy deprisa."
	ralldefaulttactic41 = "El boss llama a adds de 2 tipos y los transforma sólo en la fase 1. Asegúrate de tener los 5 adds distintos antes de pasar a la segunda fase: Fanático del Culto, Fanático Deformado, Fanático Reanimado, Partidiario del Culto, Partidiario Reanimado (el Partidiario Potenciado no cuenta, simplemente mátalo)."
	ralldefaulttactic42 = "Hay bastantes tácticas. Simplemente no visites el barco enemigo más de 1 vez."
	ralldefaulttactic43 = "Aparecerán Espora de Gas tres veces antes de que el boss haga daño en área reseteando las acumulaciones. Cuando la Espora de Gas explota te otorga 1 acumulación de Inoculado (25% de resistencia a las sombras). No puedes acumular 3. La mejor estrategia es que las 2 primeras personas en obtener el perjuicio sean las únicas que lo tengan. Sin embargo, la segunda vez, es necesario que todos EXCEPTO los 2 primeros obtengan Inoculado."
	ralldefaulttactic44 = "El boss lanza un perjuicio a un jugador aleatorio, que cuando se remueve o acaba hace aparecer un pequeño moco. Cuando 2 mocos pequeños se acercan a otro se transformarán en uno grande. Éste explotará y hará fallar el logro si consume 5 mocos pequeños. Así que matad rápidamente al boss y no dejeis que los mocos se unan."
	ralldefaulttactic45 = "\"Mocos regurgitados\" - Los Mocos Regurgitados tienen un efecto sorprendente en el objetivo, reduciendo su velocidad de movimiento un 50% y haciendo un daño de 6338 a 6662 cada 2 seg durante 20seg. Mata los adds sin usar esta habilidad."
	ralldefaulttactic46 = "Normalmente este daño lo sufre el tanque de Keleseth. Debe tener muchos \"Núcleo Oscuro\" en él para evitar grandes daños."
	ralldefaulttactic47 = "El logro se consigue asegurándose de que todos los portales son usados por alguien cada vez que aparezcan. El addon NO hace el seguimiento en dificultad heróica."
	ralldefaulttactic48 = "\"Sacudida Mística! Bufa a todos los enemigos cercanos con magia cada 6 seg, incrementando el daño mágico recibido un 10% por acumulación. Para resetear las acumulaciones tienes que estar fuera de la línea de visión del boss usando las Tumbas de Hielo. Es difícil para los tanques ya que su rotación es bastante complicada."
	ralldefaulttactic49 = "Descripción: \"Peste Necrótica\" - Si el objetivo muere mientras está aflijido o si el efecto se acaba, dicho efecto gana una acumulación adicional y salta a una unidad cercana. Si el efecto es removido, perderá una acumulación y saltará a una unidad cercana.\nTáctica: El tanque secundario cogerá todos los adds. La 1ª Peste Necrótica tiene que removerse LEJOS de los adds, todas las Pestes siguientes se han de remover cerca de los adds y esperar hasta que uno de los adds tenga 30 acumulaciones de Peste Necrótica (¡el addon te avisa!). Mata al boss para conseguir el logro."
	ralldefaulttactic5 = "Arranca el boss antes de que llegue arriba y cierre las puertas"
	ralldefaulttactic50 = "Los Espíritu Malvado se unirán al combate en la fase 3 (<40%). Simplemente mátalos rápido. Explotan cuando se acercan a los jugadores."
	ralldefaulttactic51 = "Este logro es soleable. Atrae todos los Defensores de Forja de Acero que puedas y mátalos. Usa el seguimiento de logros del juego para asegurarte."
	ralldefaulttactic52 = "Logro individual. Los Pasajeros del Demoledor pueden ser lanzados encima del Leviatán de Llamas, donde ellos podrán matar las Torreta Defensiva. Para conseguir el logro tienes que hacer un golpe de gracia."
	ralldefaulttactic53 = "Los jugadores pueden ser lanzados encima del Leviatán de Llamas desde los demoledores para eliminar las torretas. Eliminar todas las torretas  activará Circuito Sobrecargado, lo que aturdirá al Leviatán produciendo que reciba un 50% más de daño y se eliminen todas las acumulaciones de Aumentando Velocidad. El logro requiere que se ignore esta mecánica."
	ralldefaulttactic54 = "\"Olla de Escoria\" - Coge a un enemigo cercano de forma aleatoria y lo mete en la Olla de Escoria. El objetivo recibe 4000 puntos de daño de Fuego cada segundo durante 10 seg. El tanque principal no es afectado por esta habilidad."
	ralldefaulttactic55 = "Los adds Ensamblajes Férreros obtienen el beneficio Calor mientras están encima del fuego soltado por el Agostar de Ignis. Una vez Calor alcance las 10 acumulaciones, los Ensamblajes ganarán el beneficio Magma, que dura 20 segundos. Si en este margen de tiempo son kiteados a una piscina de agua perderán el beneficio Magma y se trasnformarán en Quebradizos durante 15 segundos. Un simple disparo de 5K o más de daño a los Ensamblajes Quebradizos los romperá, causando una explosión. Haciendo esto último con 2 o más Ensamblajes en un margen de 5 segundos garantizará el logro."
	ralldefaulttactic56 = "Haz DPS a un sólo objetivo (sin usar daños de área) y baja a todos los Guardián Runa Oscura a menos de 15K de vida. Cuando acaba la fase de tierra de Tajoescama usará el Aliento de Llamas en un área directamente enfrente de él. El contador no se resetea nunca."
	ralldefaulttactic57 = "50% de vida del boss en la fase de suelo"
	ralldefaulttactic58 = "La descripción del logro no es correcta. Es difícil entender qué es lo que falla."
	ralldefaulttactic59 = "No permitas que los Robot Chatarra XP-013 alcancen y curen al Desarmador XA-002 en dificultad normal. Estos robots aparecen durante la fase del corazón expuesto, a cada intérvalo de 25% de vida. Ellos ignoran el agro y continuan moviéndose hacia el Desarmador. Los robots pueden ser ralentizados y enraizados."
	ralldefaulttactic6 = "¡No dejes que las serpientes ataquen a nadie durante mucho tiempo! Mátalas o simplemente mata rápido al boss."
	ralldefaulttactic60 = "En cada intérvalo de 25% vida, el corazón del Desarmador XA-002 se expondrá y aparecerán adds. Entre ellos algunos Robot Bum XE-321 y varios Robot Chatarra XP-013 que se moverán hacia el Desarmador. Cuando se matan los Robot Bum XE-321 explotan causando daño a cualquiera cerca de ellos."
	ralldefaulttactic61 = "Requiere que el jugador esté bajo los efectos de la Petaca de Hierro cuando muere el último boss de la Asamblea de Hierro. La Petaca se puede comprar en Cumbres Tormentosas de Olut Alegut (H) o Rork Sharpchin (A)."
	ralldefaulttactic62 = "Todo el mundo se coloca a rango melé, excepto 3 rangeds. Ellos kitearan el Haz Ocular Enfocado."
	ralldefaulttactic63 = "Mata los brazos y espera a que reaparezcan. No hagas nada de daño al boss"
	ralldefaulttactic64 = "Pega al boss hasta el %s de vida, entonces mata ambos brazos de golpe"
	ralldefaulttactic65 = "El Defensor Feral aparece tras 1 minuto y comienza el combate con 8 acumulaciones de Esencia Feral. Revivirá por si mismo al coste de 1 de esas acumulaciones. Lograr el logro requiere matar al Defensor 9 veces y después matar al boss, antes de que llegue el enfurecimiento."
	ralldefaulttactic66 = "Logro individual. Poder de Tormenta beneficia a un jugador durante 30 segundos independientemente de dónde se encuentre, pero los beneficios Fuego Calentito y la Luz Estelar parecen estar limitados a sitios aleatorios. Has de conseguir los 3 beneficios."
	ralldefaulttactic67 = "Mata todas las Congelación Apresurada que aparecerán en los NPC"
	ralldefaulttactic68 = "Todos los miembros de la banda deben evitar todas las Congelación Apresurada situándose en los Ventisqueros. Aparecen después de que cae un bloque de hielo al suelo"
	ralldefaulttactic69 = "No permitir que nadie de la banda tenga más de 2 acumulaciones de Frío Cortante mientras se mata a Hodir. El Frío Cortante gana acumulaciones durante todo el combate y cada acumulación causa daño en el tiempo. Tanto moviéndose como estando cerca de un Fuego Calentito creado por el add mago, eliminará las acumulaciones. El removible Congelar y el evitable Congelación Apresurada complica el usar el movimiento para quitarse las acumulaciones."
	ralldefaulttactic7 = "Tienes que interrumpir todos los casteos de \"Interrupción\". El tiempo de casteo baja con la vida."
	ralldefaulttactic70 = "Tienes 3 min para matar al boss antes de que rompa su alijo poco común."
	ralldefaulttactic71 = "Una vez la banda haya completado el laberinto y puesto en marcha a Thorim, él lanzará Carga Relámpago cada 15 segundos. Aparece un ataque en cono que se origina en Thorim y que dirige un rayo a un orbe de los que rodea la arena."
	ralldefaulttactic72 = "Estos adds se encuentran todos mientras la banda avanza a través del laberinto. Todos los miembros de la banda conseguirán este logro una vez mates al boss."
	ralldefaulttactic73 = "El Belisario Runa Oscura (un NPC que aparece durante la primera fase) otorga el beneficio \"Aura de Velocidad\". Este NPC tiene que ser controlado por un sacerdote para que el grupo se beneficie de esta aura mientras se derrota a Thorim. El radio del aura es de 40 metros."
	ralldefaulttactic74 = "Habrán 6 oleadas de adds. Mata 5 oleadas y entonces mata al boss con la última oleada viva."
	ralldefaulttactic75 = "Todo la banda debe de evitar: las Minas de Proximidad de las fases 1 y 4, los Golpe de Cohete de las fases 2 y 4, y las explosiones de los Bombabot de la fase 3. El logro se puede hacer en distintas tandas, por lo que esquivando todos los Bombabot se completará esa condición y permitirá a la banda enfocarse más en las Minas de Proximidad o los Golpe de Cohete en la siguiente semana."
	ralldefaulttactic76 = "Uno de los Robot de Asalto de la fase 3 debe quedar vivo para la fase 4. En la fase 4, Mimiron volverá a lanzar el letal Golpe de Cohete a algún sitio precedido de un aviso visible de 3 segundos. Lleva al Robot de Asalto dentro del área de impacto."
	ralldefaulttactic77 = "Modo Heróico. No mates ningún Vapores de Saronita. Espera a que se transformen en el Animus de Saronita, mátalo y después elimina al boss."
	ralldefaulttactic78 = "Usa la emoción /kiss en Sara durante la fase 2 del encuentro con Yogg-Saron. Macro:\n/tar Sara\n/kiss"
	ralldefaulttactic79 = "Durante la fase 2 se abrirán unos portales cerca de Yogg-Saron. Cuando entres en uno, estarás en una de las 3 visiones."
	ralldefaulttactic8 = "Para conseguir el perjuicio Residuo de Eck, necesitas que Eck te de un golpe con su habilidad de cono frontal: Flema de Eck. Después has de matar el último boss sin morir y con el perjuicio encima."
	ralldefaulttactic80 = "Comienzas el combate con un 100% de Cordura la cual va bajando cuando te afectan las habilidades de Yogg-Saron. Durante el combate, van apareciendo Pozos de Cordura, que son usados para recuperar la Cordura perdida cuanto más tiempo estés en el Pozo (sólo si habeis pedido a Freya que os ayude). Cuando una persona llega al 0% de Cordura pasa a ser controlada por Yogg-Saron hasta que muere uno de los dos."
	ralldefaulttactic81 = "Los Agujero Negro se forman cuando muere una Estrella en Colapso. Este logro pide que se cierren los Agujero Negro llevando las Constelación Viviente dentro de ellos de forma simultánea."
	ralldefaulttactic82 = "Cada vez que el Patán Inútil usa su habilidad de carga en un jugador, aparece un número aleatorio de Rata de Mina alrededor de la pila de madera en la que impactó el jugador. El contador no se resetea, así que se puede hacer poco a poco."
	ralldefaulttactic83 = "Necesitas matar el boss al primer intento y evitando que el segador reciba daño durante los pulls (posible BUG) y durante el combate con el boss para conseguir el logro (el segador es immune al daño de fuego de los adds del boss)."
	ralldefaulttactic84 = "Logro individual. El boss lanza un muro de fuego durante toda la segunda fase."
	ralldefaulttactic85 = "Después de cada 'Asfixiar', el boss canaliza 'Ejecución Pospuesta'. Hay que interrumpirlo de inmediato."
	ralldefaulttactic86 = "Los adds (no el boss) castean 'Poder Profano'. Interrumpe todos esos casteos."
	ralldefaulttactic87 = "Cuando salgan los adds, haz que uno de ellos muera con el Géiser. No es necesario matar al boss para conseguir este logro."
	ralldefaulttactic88 = "No mates al Behemoth Implacable hasta  que obtengas el beneficio Fuerza del Oleaje en la 3ra fase."
	ralldefaulttactic89 = "Deja evolucionar a los Zelote Crepuscular de 1 en 1 y mátalos rápidamente (antes de que destrocen a tu tanque). Evolucionan si no tapas el rayo."
	ralldefaulttactic9 = "Actualmente, la habilidad Empalar no se castea en el objetivo con más agro, por lo que ya no hacen falta 2 tanques. Mata el boss cuando todos los miembros del grupo hayan sido empalados."
	ralldefaulttactic90 = "Logro individual. Salta cuando el boss esté acabando de castear 'Adhesión Estática', así no serás enraizado por esta habilidad. La mejor manera de conseguir este logro es saltar durante todo el combate."
	ralldefaulttactic91 = "Para conseguirlo, debes matar a un Habitante Trogg infectado cerca del boss. Atención: 'Malicia de Modgud' incrementa el daño realizado un 100%."
	ralldefaulttactic92 = "El logro será otorgado a todo el grupo. Hay más de 5 orbes en la estancia, debes conseguir 5 de ellos. Por ejemplo, 2 de ellos están por encima de la plataforma del 2º boss y para conseguirlos has de usar uno de los tornados durante el combate."
	ralldefaulttactic93 = "Cuando entres en el 'Mundo de los Espíritus' al 50%, aparece un Fénix Oscuro. Cada algunos segundos, aparecerá un Trozo de Alma que canalizará una sanación en el Fénix Oscuro. Mueve las almas a través de los regueros de llamas para transformarlas en Alma Ardiente. Mata a 3 de estas y conseguirás el logro, ¡sin matar al boss!."
	ralldefaulttactic94 = "Sólo puedes realizar la mitad de este logro en tu primera muerte del boss. Para la otra mitad tienes que volver a matarlo. Si quieres ser mordido (o NO serlo) dilo. Cuanto más DPS se haga, menos personas tendrán que ser mordidas."
	ralldefaulttacticmain1 = "¡El addon te informará en el chat cuando sea posible matar al boss!"
	ralldefaulttacticmain2 = "Atención: ¡tus mascotas o tótems pueden hacer fallar este logro!"
	ralldefaulttacticmain3 = "El fallo del logro será salvado en la ID de estancia, y no se puede resetear este día"
	ralldifparty = "grupo"
	ralldifraid = "banda"
	ralldifscenario = "gesta"
	rallglory = "gloria"
	rallmanualtxt1 = "Expansión:"
	rallmanualtxt2 = "Dificultad:"
	rallmanualtxt3 = "Localización:"
	rallmenutxt1 = "    Lista de logros disponibles en la localización actual"
	rallmenutxt2 = "    Lista de logros escogiendo localización"
	rallmenutxt3 = "    Tácticas para logros de grupo"
	rallnoaddontrack = "NO hay seguimiento por el addon"
	rallnotfoundachiv1 = "no se han encontrado logros sin completar"
	rallnotfoundachiv2 = "no hay logros"
	rallnotfromboss = "no del boss"
	rallsend = "Enviado"
	ralltacticbutsave1 = "Aplicar cambios"
	ralltacticbutsave2 = "Restablecer las tácticas por defecto"
	ralltactictext1 = "Elige logro:"
	ralltactictext2 = "necesita táctica"
	ralltactictext3 = "táctica: /raida"
	ralltitle2 = "Este módulo informa sobre los logros en |cff00ff00localización actual|r, cuando entras en una estancia. También te recuerda si un boss tiene algún logro necesario con sólo señalarlo. P.D. '|cffff0000no hay seguimiento por el addon|r' significa que el addon no puede hacer un seguimiento de ese logro y que no te informará de si se falla, '|cffff0000no se obtiene del boss|r' - el objetivo del logro no necesita matar al boss, sólamente hacer alguna cosa. En el cuadro actual puedes ver todos los grupos de logros disponibles en la localización actual"
	ralltitle3 = "Este módulo muestra los logros disponibles en la localización escogida. Puedes enviar esta información al chat"
	ralltitle33 = "'táctica: /raida' muestra en el chat las tácticas para los logros que puedan presentar dificultades. Aquí puedes ver todas las tácticas, es muy útil si es la primera vez que entras en una mazmorra. Puedes editar el texto y enviarlo al chat. Los cambios se aplican a todos los personajes.\nP.D. Envíame tus comentarios o tácticas, ¡y estarán disponibles en el addon para ayudar a otros!\nP.D.2 ¿Has encontrado muchos errores en la traducción al castellano? ¡Escríbeme para tener aceeso a la página del proyecto en Curse para corregirlos!"
	ralltooltiptxt = "Mostrar en la descripción"
	ralltooltiptxt2 = "RA: Encontrados %s logros"
	ralltooltiptxt21 = "RA: Logros encontrados"
	ralltooltiptxt3 = "Más información: /raida"
	ralltxt1 = "Cuando entres en una estancia te informa:"
	ralltxt10 = "sólo logros sin completar necesarios para 'gloria del héroe/raider'"
	ralltxt11 = "sólo logros necesarios para 'gloria del héroe/raider', incluyendo los ya completados"
	ralltxt12 = "Versión COMPLETA - TODOS los logros que necesito, incluyendo las muertes de los bosses en normal/heróico etc"
	ralltxt13 = "versión COMPLETA - TODOS los logros de esta localización"
	ralltxt2 = "sólo logros sin completar"
	ralltxt3 = "todos los logros, incluyendo los ya completados"
	ralltxt4 = "sólo los logros sin completar necesarios para 'gloria del héroe/raider'"
	ralltxt5 = "sólo los logros necesarios para 'gloria del héroe/raider', incluyendo los ya completados"
	ralltxt6 = "versión COMPLETA - TODOS los logro que necesito, incluyendo las muertes de bosses en normal/heróico etc"
	ralltxt7 = "Cuando señalas al boss te informa:"
	ralltxt8 = "sólo logros sin completar"
	ralltxt9 = "todos los logros, incluyendo los ya completados"
	ralltxtoff = "(deshabilitado)"
	ralltxton = "(habilitado)"
	ralluilooktactic1 = "Mostrar tácticas"
	ralluilooktactic3 = "|cffff0000Sin táctica|r, quizás este logro es fácil de entender a través de su descripción. Si quieres |cff00ff00para añadir tu propia táctica - escribe texto aquí|r"
	ralluilooktactic4 = "Los cambios se han salvado satisfactoriamente."
	ralluilooktactic5 = "Táctica"
	rallwhisper = "susurro:"
	rallzonenotfound = "La localización actual no se ha encontrado en la base de datos."

end


end