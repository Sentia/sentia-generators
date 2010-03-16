class SentiaAuthenticationGenerator < Rails::Generator::Base
  # attr_accessor :name
  
  def initialize(runtime_args, runtime_options = {})
    super
    #usage if @args.length != 2
    
    # @name = @args[0] || 'application'
  end
  
  def manifest
    # record do |m|
    #   m.directory 'app/views/layouts'
    #   m.directory 'public/stylesheets/sass'
    #   
    #   m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
    #   m.file "stylesheet.sass", "public/stylesheets/sass/#{file_name}.sass"
    # end
  end
  
  # def file_name
  #   name.underscore
  # end
 
  protected
 
    def add_options!(opt)
       opt.separator ''
       opt.separator 'Options:'
      
       opt.on("--no_activation", "Generate authlogic features and password_reset functions only.") { |v| options[:no_activation] = v }
       opt.on("--no_password_resets", "Generate authlogic features and activation functions only.") { |v| options[:no_password_resets] = v }
       opt.on("--none", "Generate authlogic features only.") { |v| options[:none] = v }
     end
  
    def banner
      <<-EOS
Creates authlogic code
 
USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end