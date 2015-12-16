# TEC PA & Lighting Main Website

[![Build Status](https://travis-ci.org/nottinghamtec/Main-Website.svg?branch=master)](https://travis-ci.org/nottinghamtec/Main-Website)

Welcome to the repo for TEC PA & Lighting. It is the aim of this project to replace TEC's current placeholder website.

# Getting Started
This project uses the static site generator [Hugo](http://gohugo.io/) to produce the content. In order to develop in this you will need the dependances installed. There is a plan to make a vagrant file to simplify for this, but for now please check the instructions for your operating systems.

- [Hugo](http://gohugo.io/)
- [Ruby](https://www.ruby-lang.org/en/downloads/)
- [RubyGems](https://rubygems.org/pages/download)
- `gem install bundler`
- `bundle install`

You can now start building using these two commands in seperate terminals.

- `compass watch`
- `hugo server -w -D`

The statically generated site will now be served locally at `http://localhost:1313/`. For convenience draft pages are built locally, but not when pushed.
