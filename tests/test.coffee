process.env.NODE_ENV = 'test'

path = require 'path'
assert = require 'assert'

describe 'test', ->

  it "test", (done) ->
    assert.equal 0, 0
    done()