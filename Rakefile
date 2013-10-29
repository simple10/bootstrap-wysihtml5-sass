require 'rubygems'
require 'bundler'
require 'fileutils'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'compass'
require 'bootstrap-sass'
require 'uglifier'
require 'sass'
require 'bootstrap-sass/compass_functions'
require 'bootstrap-sass/sass_functions'
require 'term/ansicolor'

Compass.configuration.http_fonts_path = '../'


ROOT = File.dirname(__FILE__)

task default: [:compile]

desc 'Compile assets to compiled directory'
task :compile do |t, args|
  lib_path = File.join(File.dirname(__FILE__), 'lib')
  $:.unshift(lib_path) unless $:.include?(lib_path)

  path = 'src'
  output_path = File.join(ROOT, "compiled")
  version = File.open(File.join(ROOT, 'VERSION')).read.strip!
  version_comment = "/* bootstrap-wysihtml5-sass v#{version} by @simple10 */\n"

  puts Term::ANSIColor.bold "Compiling JS in #{path}"

  js_input_path = File.join(path, 'bootstrap-wysihtml5.js')

  js_output_path = File.join(output_path, "bootstrap-wysihtml5.js")
  puts Term::ANSIColor.cyan("  #{js_output_path}") + '...'
  File.open(js_output_path, 'w') { |f| f.write(version_comment + File.read(js_input_path)) }

  minified_js_output_path = File.join(output_path, "bootstrap-wysihtml5.min.js")
  puts Term::ANSIColor.cyan("  #{minified_js_output_path}") + '...'
  minified_js = Uglifier.compile(File.read(js_input_path))
  File.open(minified_js_output_path, 'w') { |f| f.write(version_comment + minified_js) }

  %w(bootstrap wysihtml5-styles).each do |file|
    save_path = File.join(output_path, "#{file}.css")
    puts Term::ANSIColor.bold "Compiling SCSS in #{path}"
    puts Term::ANSIColor.cyan("  #{save_path}") + '...'
    spec = Gem::Specification.find_by_name("bootstrap-sass")
    bootstrap_path = "#{spec.gem_dir}/vendor/assets/stylesheets"
    engine    = Sass::Engine.for_file("#{path}/#{file}.scss", syntax: :scss, load_paths: [path, bootstrap_path])
    css       = engine.render
    File.open(save_path, 'w') { |f| f.write(version_comment + css) }
  end
end
