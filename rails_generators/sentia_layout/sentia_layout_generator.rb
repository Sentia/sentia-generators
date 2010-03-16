class SentiaLayoutGenerator < Rails::Generator::Base
  attr_accessor :name
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.length != 2
    
    @name = @args[0] || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets/sass'
      
      m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
      m.file "stylesheet.sass", "public/stylesheets/sass/#{file_name}.sass"
    end
  end
  
  def file_name
    name.underscore
  end
 
  protected
 
    # def add_options!(opt)
    #   opt.separator ''
    #   opt.separator 'Options:'
    #   opt.on("--haml", "Generate HAML for view, and SASS for stylesheet.") { |v| options[:haml] = v }
    # end
 
    def banner
      <<-EOS
Creates generic layout and stylesheet files.
 
USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end