# RSpec Code Coverage Lab

## Objectives

1. Introduce a helpful tool for writing tests and ensuring clean and well-functioning code. 
2. Practice writing your own RSpec tests. 

## Introduction

How do we know we have enough tests, and that our tests cover all of our code?

Enter [simplecov](https://github.com/colszowka/simplecov)! simplecov is a tool that will measure your test run against the code paths in your code files and see if you're exercising them all. "Code Paths" includes method calls, conditional statements, loops, and anything that branches program flow.

This is important because you want to be able to know that every decision your program makes is being tested, no matter what.

## Overview

This lab utilizes our Jukebox domain model. We have Jukebox and Song classes. You'll be using the simplecov tool to guide you to write tests that cover 100% of the code in our program.

## Instructions

1. Install the simplecov gem with `gem install simplecov`.
2. Run your spec file with `rspec`.

You should see output at the end of the test results that looks something like:

```bash
Coverage report generated for RSpec to /Users/scottreynolds/code/ta/labs/simplecov/coverage. 14 / 33 LOC (42.42%) covered.
```

3. Open `coverage/index.html` in your browser window to view the report. Try to get the coverage to 100% by writing RSpec tests. Every time you add a test, run `rspec` to see if the test is passing. Every time you run `rspec`, simplecov will also run. Continue to open the `coverage/index.html` file after every run to see your updated test coverage. Toggle the individual file view to see which lines are covered by your tests. 

## Resources
* [Christoph Olszowka](https://github.com/colszowka/) - [SimpleCov](https://github.com/colszowka/simplecov)
* [RailsCasts](http://railscasts.com/) - [Metrics Metrics Metrics](http://railscasts.com/episodes/252-metrics-metrics-metrics)
* [About.com](http://ruby.about.com/) - [Simple Code Metrics in Ruby with SimpleCov](http://ruby.about.com/od/simplecov/ss/Simple-Code-Metrics-In-Ruby-With-Simplecov.htm)
