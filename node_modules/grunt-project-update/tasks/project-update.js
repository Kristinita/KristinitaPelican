/*
 * grunt-project-update
 * https://github.com/snailjs/grunt-project-update
 *
 * Copyright (c) 2013 Bryan Tong
 * Licensed under the LGPLv3 license.
 */
var fs = require('fs')
  , path = require('path')


/**
 * Export grunt plugin
 * @param {object} grunt
 * @type {exports}
 */
module.exports = exports = function(grunt){
  grunt.registerMultiTask(
    'projectUpdate',
    'Grunt task to update bower, npm, and other arbitrary update tasks',
    function(){
      var that = this
      var done = that.async()
      var commands = this.data.commands || []
      var cwd = this.data.cwd || null
      /**
       * Manager Definitions
       * @type {object}
       */
      var managers = {
        npm: {
          enabled: false,
          file: 'package.json',
          commands: [
            {cmd: 'npm', args: ['prune'], cwd: cwd},
            {cmd: 'npm', args: ['install'], cwd: cwd},
            {cmd: 'npm', args: ['update'], cwd: cwd}
          ]
        },
        bower: {
          enabled: false,
          file: 'bower.json',
          commands: [
            {cmd: 'bower', args: ['prune'], cwd: cwd},
            {cmd: 'bower', args: ['install'], cwd: cwd},
            {cmd: 'bower', args: ['update'], cwd: cwd}
          ]
        }
      }
      //enable detected managers
      for(var key in managers){
        if(!managers.hasOwnProperty(key)) continue
        //auto enable the module by reading the package file
        if(fs.existsSync(managers[key].file)){
          //however only do this if the user hasnt specifically disabled it
          if(!that.data.hasOwnProperty(key) || true === that.data[key])
            managers[key].enabled = true
        } else if(true === that.data[key]){
          managers[key].enabled = true
        }
        //if the manager is enabled, add its commands for exec
        if(managers[key].enabled){
          commands = commands.concat(managers[key].commands)
        }
      }
      //cache current working dir
      var _cwd = process.cwd()
      //run the queued commands
      require('async').eachSeries(
        commands,
        function(opts,fn){
          if(opts.cwd && fs.existsSync(path.resolve(opts.cwd))){
            process.chdir(path.resolve(opts.cwd))
          }
          grunt.log.writeln('Executing ' + opts.cmd + ' ' + opts.args.join(' '))
          grunt.util.spawn(opts,function(err,res){
            if(err) fn(err)
            else {
              if(res.stderr) grunt.log.ok(res.stderr)
              if(res.stdout) grunt.log.ok(res.stdout)
              fn()
            }
          })
        },
        function(err){
          if(err) throw err
          done()
        }
      )
      //restore working dir
      process.chdir(_cwd)
    }
  )
}
