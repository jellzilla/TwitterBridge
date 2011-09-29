INTERACTION & EXPRESSION USING THE PAUSCH BRIDGE LIGHTING
=========================================================

Proof of Concept
================
As a proof of concept for @Pausch_Bridge, we will demonstrate a Twitter
accessible web bridge. Instead of sending commands to a pharos controller,
this interface parses Twitter messages and passes them to a simple web
interface.

Dependencies and Running
========================
Install rvm, ruby and rubygems. Install bundler.
$ bundle install
$ rackup

Functional Design
=================
1. User Tweets at @Pausch_Bridge.
2. Download new Tweet.
3. Parse Tweet.
4. Website changes to reflect the command.\

## Available Commands
  - "#rrggbb" - Hex value to specify new color

## Responses
  - "hello, it's <time>" - On start-up (randomized to avoid twitter rate limiting)
  - "goodbye, it's <time>" - On shut-down
  - "thanks, i'll change it to #rrggbb!" - Direct Message on receiving a successful color command
  - "nope, i don't know how to do that!" - DM upon receiving a failed command
