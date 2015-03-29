Package.describe({
  name: "pfafman:materialize-modal",
  summary: "Display a modal via Materialize written in coffeescript",
  version: "0.2.1_1",
  git: "https://github.com/pfafman/meteor-materialize-modal.git"
});

Package.on_use(function(api, where) {
  api.versionsFrom("METEOR@1.0.4");

  api.use([
    'underscore',
    'templating',
    'ui',
    'jquery',
    'coffeescript',
    'reactive-var',
  ], 'client');

  api.add_files([
    'lib/modal.css',
    'lib/modal.html',
    'lib/modal.coffee'
  ], 'client');

  if (api.export) {
    api.export('MaterializeModal')
  }

});


Package.on_test(function(api) {
  api.use("pfafman:materialize-modal", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('modal_tests.coffee', 'client');
});
