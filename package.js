Package.describe({
  name: "pfafman:materialize-modal",
  summary: "Display a modal via Materialize written in coffeescript",
  version: "1.0.1",
  git: "https://github.com/pfafman/meteor-materialize-modal.git"
});

Package.onUse(function(api, where) {
  api.versionsFrom("METEOR@1.2");

  api.use([
    'underscore',
    'templating',
    'blaze',
    'jquery',
    'reactive-var',
  ], 'client');

  api.use([
    'softwarerero:accounts-t9n@1.1.0',
    'coffeescript'
  ], ["client", "server"]);

  api.addFiles([
    'lib/modal.css',
    'lib/modal.html',
    'lib/MaterializeModal.coffee',
    'lib/modal.coffee'
  ], 'client');

  api.addFiles([
    'lib/t9n.coffee',
    'lib/warning.coffee'
  ], ['client', 'server']);

  if (api.export) {
    api.export('MaterializeModal')
  }

});


Package.onTest(function(api) {
  api.use("pfafman:materialize-modal", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('tests/modal_tests.coffee', 'client');
});
