Package.describe({
  name: "pfafman:materialize-modal",
  summary: "Display a modal via Materialize written in coffeescript",
  version: "0.4.0",
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
    'softwarerero:accounts-t9n@1.1.4',
    'coffeescript'
  ], ["client", "server"]);

  api.addFiles([
    'lib/modal.css',
    'lib/modal.html',
    'lib/MaterializeModalClass.coffee',
    'lib/modal.coffee'
  ], 'client');

  api.addFiles([
    'lib/t9n.coffee'
  ], ['client', 'server']);

  if (api.export) {
    api.export('MaterializeModal')
  }

});


Package.onTest(function(api) {
  api.use("pfafman:materialize-modal", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('modal_tests.coffee', 'client');
});
