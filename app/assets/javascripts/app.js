//= require_self
//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./mixins
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require ./router
//= require_tree ./routes


App = Em.Application.create({LOG_TRANSITIONS: true});

App.cameFromHomepage = false

// this are langauages to be selected in the form
App.languages = [
  Ember.Object.create({ value: "no role specified", label: "no role specified" }),
  Ember.Object.create({ value: "I don't know what the language is", label: "I don't know what the language is" }),
  Ember.Object.create({ value: "Language not in list", label: "Language not in list" }),
  Ember.Object.create({ value: "english", label: "English" }),
  Ember.Object.create({ value: "arabic", label: "Arabic" }),
  Ember.Object.create({ value: "armenian", label: "Armenian" }),
  Ember.Object.create({ value: "balinese", label: "Balinese" }),
  Ember.Object.create({ value: "bengali", label: "Bengali" }),
  Ember.Object.create({ value: "bosnian", label: "Bosnian" }),
  Ember.Object.create({ value: "bulgarian", label: "Bulgarian" }),
  Ember.Object.create({ value: "chinese", label: "Chinese" }),
  Ember.Object.create({ value: "croatian", label: "Croatian" }),
  Ember.Object.create({ value: "czech", label: "Czech" }),
  Ember.Object.create({ value: "danish", label: "Danish" }),
  Ember.Object.create({ value: "dutch", label: "Dutch" }),
  Ember.Object.create({ value: "estonian", label: "Estonian" }),
  Ember.Object.create({ value: "farsi/Persian", label: "Farsi/Persian" }),
  Ember.Object.create({ value: "finnish", label: "Finnish" }),
  Ember.Object.create({ value: "french", label: "French" }),
  Ember.Object.create({ value: "georgian", label: "Georgian" }),
  Ember.Object.create({ value: "german", label: "German" }),
  Ember.Object.create({ value: "greek", label: "Greek" }),
  Ember.Object.create({ value: "hebrew", label: "Hebrew" }),
  Ember.Object.create({ value: "hindi", label: "Hindi" }),
  Ember.Object.create({ value: "hungarian", label: "Hungarian" }),
  Ember.Object.create({ value: "icelandic", label: "Icelandic" }),
  Ember.Object.create({ value: "indonesian", label: "Indonesian" }),
  Ember.Object.create({ value: "italian", label: "Italian" }),
  Ember.Object.create({ value: "japanese", label: "Japanese" }),
  Ember.Object.create({ value: "kazak", label: "Kazak" }),
  Ember.Object.create({ value: "korean", label: "Korean" }),
  Ember.Object.create({ value: "kurdish", label: "Kurdish" }),
  Ember.Object.create({ value: "lao", label: "Lao" }),
  Ember.Object.create({ value: "latvian", label: "Latvian" }),
  Ember.Object.create({ value: "lithuanian", label: "Lithuanian" }),
  Ember.Object.create({ value: "macedonian", label: "Macedonian" }),
  Ember.Object.create({ value: "malay", label: "Malay" }),
  Ember.Object.create({ value: "norwegian", label: "Norwegian" }),
  Ember.Object.create({ value: "panjabi", label: "Panjabi" }),
  Ember.Object.create({ value: "pashto", label: "Pashto" }),
  Ember.Object.create({ value: "polish", label: "Polish" }),
  Ember.Object.create({ value: "portuguese", label: "Portuguese" }),
  Ember.Object.create({ value: "rumanian", label: "Rumanian" }),
  Ember.Object.create({ value: "russian", label: "Russian" }),
  Ember.Object.create({ value: "serbian", label: "Serbian" }),
  Ember.Object.create({ value: "serbo-Croatian (unspecified)", label: "Serbo-Croatian (unspecified)" }),
  Ember.Object.create({ value: "sindhi", label: "Sindhi" }),
  Ember.Object.create({ value: "slovenian", label: "Slovenian" }),
  Ember.Object.create({ value: "spanish", label: "Spanish" }),
  Ember.Object.create({ value: "swedish", label: "Swedish" }),
  Ember.Object.create({ value: "tagalog", label: "Tagalog" }),
  Ember.Object.create({ value: "tajik", label: "Tajik" }),
  Ember.Object.create({ value: "tamil", label: "Tamil" }),
  Ember.Object.create({ value: "thai", label: "Thai" }),
  Ember.Object.create({ value: "turkish", label: "Turkish" }),
  Ember.Object.create({ value: "uighur", label: "Uighur" }),
  Ember.Object.create({ value: "urdu", label: "Urdu" }),
  Ember.Object.create({ value: "uzbek", label: "Uzbek" }),
  Ember.Object.create({ value: "vietnamese", label: "Vietnamese" })
];

// these are languages selected on the index page
App.index_page_languages = [
Ember.Object.create({ value: 'english', label: 'English'}),
Ember.Object.create({ value: 'other_unspecified', label: 'Unspecified language (mostly English)'}),
Ember.Object.create({ value: 'chinese', label: 'Chinese'}),
Ember.Object.create({ value: 'french', label: 'French'}),
Ember.Object.create({ value: 'german', label: 'German'}),
Ember.Object.create({ value: 'italian', label: 'Italian'}),
Ember.Object.create({ value: 'japanese', label: 'Japanese'}),
Ember.Object.create({ value: 'korean', label: 'Korean'}),
Ember.Object.create({ value: 'polish', label: 'Polish'}),
Ember.Object.create({ value: 'russian', label: 'Russian'}),
Ember.Object.create({ value: 'spanish', label: 'Spanish'}),
Ember.Object.create({ value: 'arabic', label: 'Arabic'}),
Ember.Object.create({ value: 'armenian', label: 'Armenian'}),
Ember.Object.create({ value: 'estonian', label: 'Estonian and Finish'}),
Ember.Object.create({ value: 'iranian', label: 'Farsi, Kurdish, Pashto, Tajik'}),
Ember.Object.create({ value: 'georgian', label: 'Georgian'}),
Ember.Object.create({ value: 'germanic', label: 'Germanic (Danish, Dutch, Icelandic, Norwegian, Swedish )'}),
Ember.Object.create({ value: 'hebrew', label: 'Hebrew'}),
Ember.Object.create({ value: 'hungarian', label: 'Hungarian'}),
Ember.Object.create({ value: 'indo-aryan', label: 'Indo-Aryan (Urdu, Hindi, Sindhi, etc.)'}),
Ember.Object.create({ value: 'baltic', label: 'Latvian and Lithuanian'}),
Ember.Object.create({ value: 'indonesian', label: 'Malayo-Polynesian (Indonesian, Malay, Tagalog, etc.)'}),
Ember.Object.create({ value: 'portuguese', label: 'Portuguese'}),
Ember.Object.create({ value: 'romanian', label: 'Romanian'}),
Ember.Object.create({ value: 'slavic', label: 'Slavic (other than Russian and Polish)'}),
Ember.Object.create({ value: 'thai', label: 'Thai and Lao'}),
Ember.Object.create({ value: 'turkish', label: 'Turkish, Kazak, Uighur, Uzbek'}),
Ember.Object.create({ value: 'vietnamese', label: 'Vietnamese'}),
Ember.Object.create({ value: 'other_lang', label: 'Other languages'})
]
