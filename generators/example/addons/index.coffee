chalk = require "chalk"
yeoman = require "yeoman-generator"
Bower = require "../../../lib/Bower"

module.exports = class SteroidsAddonsExample extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nSteroids Addons example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"steroidsAddonsExample.html\"")}

        In the meantime, we'll install the following Bower dependencies:

        """
      )

      bower = new Bower
      bower.install([
        "git@github.com:AppGyver/steroids-addons.git#0.2.1"
      ], { save: true })

  createExample: ->
    @log.writeln(
      """
      Generating Steroids Addons example...

      """
    )

    @copy "steroidsAddonsExample.html", "www/steroidsAddonsExample.html"