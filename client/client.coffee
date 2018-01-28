T9n = (require 'meteor-accounts-t9n').T9n
T9n.setTracker require 'meteor/tracker'

Template.registerHelper 't9n', (x, params) -> T9n.get(x, true, params.hash)
Template.registerHelper 'currentLang', () => T9n.getLanguage()

Template.app.onCreated () =>
  T9n.map 'de',
    'hello': 'Hallo @{name}!'
    'pun': '@{subject} @{predicate} @{adverb} @{object}. @{adverb} @{object} @{predicate} @{subject}.'
  T9n.map 'es',
    'hello': 'Hola @{name}!'
    'pun': 'Eso ya no se como traducir bien.'
  T9n.map 'de', 'buttonText': 'Sprache wechseln' # Add another translations to an existing dictionary
  T9n.map 'es', 'buttonText': 'Cambiar idioma'
  T9n.setLanguage 'de'

Template.app.events
  'click button': => T9n.setLanguage if T9n.getLanguage() is 'es' then 'de' else 'es'
