require 'rbuild-cfamily.rb'

objects = build_objects(:sources => Dir['*.cpp'])

build_archive(:archive => 'libCppUnitLite.a',
              :objects => objects)