
DEBUG = false

console.log("Modal T9n", T9n) if DEBUG

en =
  'Close': 'Close'
  'close': 'close'
  'OK': 'OK'
  'ok': 'ok'
  'Ok': 'Ok'
  'You need to pass a message to materialize modal!':'You need to pass a message to materialize modal!'
  'Message': 'Message'
  'Alert': 'Alert'
  'Error': 'Error'
  'Confirm': 'Confirm'
  'cancel': 'cancel'
  'save': 'save'
  'Feedback?': 'Feedback?'
  'Prompt': 'Prompt'
  'submit': 'submit'
  "Type something here": "Type something here"
  'Loading': 'Loading'
  "Error: No template specified!": "Error: No template specified!"
  "Edit Record": "Edit Record"

T9n?.map?("en", en)


it =
  "Loading": "Caricamento"
  "submit": "presentare"
  "Alert": "Allarme"
  "Prompt": "Pronto"
  "Type something here": "Digita qualcosa qui"
  "OK": "OK"
  'ok': 'ok'
  "Message": "Messaggio"
  "Error": "Errore"
  "Edit Record": "Modifica record"
  "cancel": "cancellare"
  "Error: No template specified!": "Error: No modello specificato!"
  "Confirm": "Confermare"
  "Feedback?": "Risposte?"
  "You need to pass a message to materialize modal!": "È necessario passare un messaggio a materializzarsi modale!"
  "Close": "Vicino"
  "save": "salvare"

T9n?.map?("it", it)


sk =
  "OK": "OK"
  'ok': 'ok'
  "Error": "Chyba"
  "Confirm": "Potvrdiť"
  "Alert": "Poplach"
  "Message": "Správa"
  "cancel": "zrušiť"
  "submit": "predložiť"
  "Close": "Zavrieť"
  "Feedback?": "Spätná väzba?"
  "Edit Record": "Upraviť záznam"
  "Type something here": "Typ niečo tu"
  "Error: No template specified!": "Chyba: žiadna šablóna uvedené!"
  "Prompt": "Okamžitý"
  "You need to pass a message to materialize modal!": "Musíte odovzdať správu zhmotniť modálne!"
  "Loading": "Nakladanie"
  "save": "ušetriť"

T9n?.map?("sk", sk)


cs =
  "Feedback?": "Zpětná vazba?"
  "submit": "předložit"
  "cancel": "zrušit"
  "Confirm": "Potvrdit"
  "Prompt": "Okamžitý"
  "Type something here": "Typ něco zde"
  "Alert": "Poplach"
  "Edit Record": "Upravit záznam"
  "Loading": "Nakládání"
  "Error": "Chyba"
  "Message": "Zpráva"
  "OK": "OK"
  'ok': 'ok'
  "Error: No template specified!": "Chyba: žádná šablona uvedeno!"
  "Close": "Zavřít"
  "You need to pass a message to materialize modal!": "Musíte předat zprávu zhmotnit modální!"
  "save": "ušetřit"

T9n?.map?("cs", cs)


fr =
  "Close": "Fermer"
  "Message": "Message"
  "OK": "OK"
  'ok': 'ok'
  "Loading": "Chargement"
  "submit": "soumettre"
  "Type something here": "Tapez quelque chose ici"
  "cancel": "annuler"
  "Edit Record": "Modifier l'enregistrement"
  "Error": "Erreur"
  "Confirm": "Confirmer"
  "Feedback?": "Commentaires?"
  "Error: No template specified!": "Erreur: Aucun modèle spécifié!"
  "You need to pass a message to materialize modal!": "Vous devez fournir un message à materialize modal!"
  "Alert": "Avertissement"
  "Prompt": "Demande"
  "save": "enregistrer"

T9n?.map?("fr", fr)


de =
  "Close": "In der Nähe"
  "Loading": "Laden"
  "Alert": "Alarm"
  "OK": "OK"
  'ok': 'ok'
  "submit": "einreichen"
  "Feedback?": "Feedback?"
  "Error": "Fehler"
  "cancel": "stornieren"
  "Error: No template specified!": "Fehler: nicht Vorlage angegeben!"
  "Edit Record": "Datensatz bearbeiten"
  "Type something here": "Geben Sie hier etwas"
  "Confirm": "Bestätigen"
  "Message": "Nachricht"
  "You need to pass a message to materialize modal!": "Sie müssen eine Nachricht übergeben zu materialisieren modalen!"
  "Prompt": "Prompt"
  "save": "sparen"

T9n?.map?("de", de)


es =
  "Close": "Cerca"
  "OK": "OK"
  'ok': 'ok'
  "Error": "Error"
  "Feedback?": "Comentarios?"
  "submit": "presentar"
  "Prompt": "Rápido"
  "Type something here": "Escriba algo aquí"
  "Edit Record": "Editar registro"
  "Error: No template specified!": "Error: No plantilla especificada!"
  "Alert": "Alerta"
  "Message": "Mensaje"
  "cancel": "cancelar"
  "You need to pass a message to materialize modal!": "Tiene que pasar un mensaje a materializarse modal!"
  "Confirm": "Confirmar"
  "Loading": "Cargando"
  "save": "guardar"

T9n?.map?('es', 'es')
