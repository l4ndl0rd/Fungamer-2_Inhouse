/*
File:				briefing.sqf
Init:				[] execVM "scripts\briefing.sqf";
Author:				l4ndl0rd
Version:			0.0.1
Date:				2020/10/08
*****************************************************************************************************************************************
=== Briefingeinträge ===
  _diaryORDNUNGSZAHL = player createDiaryRecord ["Diary",["TITEL",
  "TEXT"
  ]];
*****************************************************************************************************************************************
=== Formatierungsoptionen ===
  # Sprung in die nächste Zeile mit <br />
  # Absatz mit <br /><br />
  # Bildeintrag mit  <br/><img image='bilder\???.jpg'/><br/>
  # Farbe ändern mit <font color='#HEXCODE DER FARBE'>TEXT</font color>
*/

_diary9 = player createDiaryRecord ["Diary",["Funkfrequenzen",
"<font color='#FFA500'>LONGRANGE</font color><br />
50 - <font color='#DAFF00'>Kommandokanal</font color><br /><br />
<font color='#FFA500'>SHORTRANGE</font color><br />
80.0 - <font color='#DAFF00'>Alpha Net</font color><br />
80.1 - <font color='#DAFF00'>Alpha 1</font color><br />
80.2 - <font color='#DAFF00'>Alpha 2</font color><br />
81.0 - <font color='#DAFF00'>Bravo Net</font color><br />
81.1 - <font color='#DAFF00'>Bravo 1</font color><br />
81.2 - <font color='#DAFF00'>Bravo 2</font color><br />"
]];

_diary8 = player createDiaryRecord ["Diary",["Sanitätseinstellungen",
"<font color='#FFA500'>ALLGEMEIN</font color><br />
<font color='#DAFF00'>Medizinische Behandlung möglich:</font color> Immer<br />
<font color='#DAFF00'>Knochenfraktur:</font color> Heilbar durch Schiene, aber kein Sprint möglich<br />
<font color='#DAFF00'>Direkter Tod möglich:</font color> Nein<br />
<font color='#DAFF00'>Örtliche Trainingssteigerung:</font color> Nein<br />
<font color='#DAFF00'>Eigennutzung von Bluttransfusion:</font color> Nein<br />
<font color='#DAFF00'>Wunden öffnen sich:</font color> Ja<br />
<font color='#DAFF00'>Maximale Wiederbelebungszeit:</font color> 15 Minuten<br />
<font color='#DAFF00'>Sanitätsmenü:</font color> Jedem selber überlassen<br /><br />
<font color='#FFA500'>MEDIKAMENTE</font color><br />
<font color='#DAFF00'>Wer:</font color> Sani oder Arzt<br />
<font color='#DAFF00'>Wo:</font color> Überall<br />
<font color='#DAFF00'>Überdosierung möglich:</font color> Ja<br /><br />
<font color='#FFA500'>WUNDEN NÄHEN</font color><br />
<font color='#DAFF00'>Wer:</font color> Sani oder Arzt<br />
<font color='#DAFF00'>Wann:</font color> Jederzeit<br />
<font color='#DAFF00'>Wo:</font color> Überall<br />
<font color='#DAFF00'>Eigenversorgung:</font color> Ja<br />
<font color='#DAFF00'>Verbrauch:</font color> Ja<br /><br />
<font color='#FFA500'>PAK</font color><br />
<font color='#DAFF00'>Wer:</font color> Sani<br />
<font color='#DAFF00'>Wann:</font color> Patient bei Bewusstsein und stabil<br />
<font color='#DAFF00'>Wo:</font color> Überall<br />
<font color='#DAFF00'>Eigenversorgung:</font color> Nein<br />
<font color='#DAFF00'>PAK Verbrauch:</font color> Nein<br /><br />
<font color='#FFA500'>AED</font color><br />
<font color='#DAFF00'>Wer:</font color> Sani<br />
<font color='#DAFF00'>Wo:</font color> Überall<br />"
]];

_diary7 = player createDiaryRecord ["Diary",["Zusatzhinweise",
"KEINE Respawn Möglichkeiten!"
]];

_diary6 = player createDiaryRecord ["Diary",["Wetterbericht",
"Kalt und stark bewölkt - für den weiteren Verlauf der Nacht ist Regen vorhergesagt."
]];

_diary5 = player createDiaryRecord ["Diary",["Rules of Engagement (RoE)",
"<font color='#DAFF00'>A.</font color> Sie haben das Recht sich mit Waffengewalt gegen Angriffe oder Bedrohungen zu verteidigen.<br /><br />
<font color='#DAFF00'>B.</font color> Gegnerisches Feuer darf sofort und effektiv erwidert werden, um einen Angriff im Keim zu ersticken.<br /><br />
<font color='#DAFF00'>C.</font color> Das Aufnehmen oder Beschlagnahmen gegnerischen Eigentums ist vom HQ abzusegnen.<br /><br />
<font color='#DAFF00'>D.</font color> Festnahmen von Zivilisten aus Gründen der Eigensicherung ist erlaubt.<br /><br />
<font color='#DAFF00'>E.</font color> Gegnerische Kombattanten, die sich ergeben haben, sind unter der Berücksichtigung der Genfer Konventionen zu behandeln.
"]];

_diary4 = player createDiaryRecord ["Diary",["Feindkräfte und -stärke",
"<font color='#FFA500'>STÄRKE</font color><br />
  Verbände der 3. Stroßarmee bestehend aus leichten bis mittelschweren Einheiten 
  der 207. Garde-Mot-Schützendivision <br /><br />
<font color='#FFA500'>BEWAFFNUNG</font color><br />
  Standardbewaffnung - keine Nachtsicht, aber Taschenlampen und Suchscheinwerfer<br /><br />
<font color='#FFA500'>FAHRZEUGE</font color><br />
  BRDM, UAZ, BMD-1, BTR-60, BTR-70, möglicherweise vereinzelte neue BTR-80<br />
  und einzelne T-72 Kampfpanzer<br /><br />
<font color='#FFA500'>LUFTUNTERSTÜTZUNG</font color><br />
	Durch Transporthubschrauber vom Typ Mi-8 möglich <br /><br />"
]];

_diary3 = player createDiaryRecord ["Diary",["Auftrag",
"<font color='#DAFF00'>1.</font color> Lokalisieren Sie den Informanten und finden Sie heraus, was er weiß<br /><br />
<font color='#DAFF00'>2.</font color> Weichen Sie sowjetischen Truppen aus, die Sowjets sind uns zahlenmäßig deutlich überlegen<br />
"]];

_diary2 = player createDiaryRecord ["Diary",["Lage",
"Die sowjetische Armee konnte im Süden und Norden weiter zurückgedrängt werden. Ein erster Angriff auf Hanstedt musste unter herben Verlusten abgebrochen werden. Im zweiten Anlauf konnte die Stadt zwar genommen
werden, allerdings wird seit dem ersten Angriff ein Zug mechanisierter Infanterie vermisst.<br /><br />
Nachdem wir den Ort erobert haben, konnten wir leider nur noch blutige Verbände und vereinzelte Ausrüstungsgegenstände bergen. Vom Bradley und unseren Leuten fehlt jede Spur.<br /><br />
Ein Zivilist hat sich bei uns gemeldet und behauptet, Informationen zum Aufenthaltsort unserer Leute zu haben. Er befindet sich etwas mehr als einen Klick nördlich von unserer Position.<br /><br />
Ratzingen ist derweil stark befestigt. Der westliche Teil des Ortes ist den ganzen Tag über von unserer Artillerie heftig eingedeckt worden, um einen Angriff vorzubereiten."]];

_diary1 = player createDiaryRecord ["Diary",["Situation",
"Deutschland 1985 - kurz nach dem Treffen zwischen Gorbatschow und Ronald Reagan am 19.11. in der Schweiz kommt es in der Sowjetunion zu einem Putsch der Hardliner,
die mit dem neuen Kurs von Glasnost und Perestroika nicht einverstanden sind. In der Folge machen sie die Armee mobil.<br /><br />
Sämtliche NATO-Nationen sind überrumpelt und werden nach den Zeichen der Entspannung völlig auf dem falschen Fuß erwischt, so dass die Rote Armee bereits nach kürzester
Zeit Berlin eingenommen hat und weiter in Richtung Westen vorrückt.<br /><br />
Im Norden rückt die 2. Gardepanzerarmee auf Hamburg vor, während die 3. Stoßarmee von Stendal aus in Richtung Hannover marschiert. Unterstützt werden beide durch die 16. Front-Luftarmee.<br /><br />
Die US-Army hat Teile ihrer Streitkräfte an die Front in den britischen Sektor verlegt. Franzosen und Briten verlegen Material und Männer an die Front und unterstützen mit einem kleinen Kontingent im Süden. 
Im Norden helfen ein paar deutsche Truppen."]];
