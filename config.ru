#!/usr/bin/env ruby
# IE2011 Group 3 Proof of concept

require './proof_of_concept.rb'

# You can install Rack middlewares
# to do some crazy stuff like logging,
# filtering, auth or build your own.
use Rack::CommonLogger
use Rack::Reloader
run ProofOfConcept.app
