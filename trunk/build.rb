CXX = 'g++ -g -Os -Wall -W -Wno-unused-parameter -Wnewline-eof -Werror'

def cxx_dependencies(source_file)
    `#{CXX} -MM #{source_file}`.gsub(/\\/, '').split(' ')[1..-1]
end

objects = Dir['*.cpp'].collect do |source_file|
    object_file = source_file.sub(/(.*).cpp/, 'Build/\1.o')

    build(:targets => [object_file],
          :dependencies => cxx_dependencies(source_file),
          :command => "#{CXX} -c #{source_file} -o #{object_file}",
          :message => "Compiling #{source_file}")
          
    object_file
end

build(:targets => ['libOSML.a'],
      :dependencies => objects,
      :command => "ar cru libOSML.a #{objects.join(' ')}; ranlib libOSML.a",
      :message => "Creating Archive libOSML.a")
