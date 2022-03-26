module Slim::SlimExt
  def copy_view_files
    binding.pry
    available_views.each do |view|
      filename = filename_with_extensions view
      binding.pry
      template "#{view}.html.slim", File.join('app', 'views', controller_file_path, filename)
    end

    template 'partial.html.slim', File.join('app/views', controller_file_path, "_#{singular_name}.html.slim")
  end
end
