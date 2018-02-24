require('should')
var grunt = require('grunt')
//there is no good way to test this module since its a meta module
describe('Grunt Project Update',function(){
  it('should have a commands array in options',function(){
    grunt.config.data.projectUpdate.should.be.type('object')
    grunt.config.data.projectUpdate.update.should.be.type('object')
  })
})