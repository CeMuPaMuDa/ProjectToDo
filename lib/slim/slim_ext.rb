# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/ClassAndModuleChildren
module Slim::SlimExt
  def copy_view_files
    available_views.each do |view|
      filename = filename_with_extensions view
      template(
        Rails.root.join('lib/templates', "#{view}.html.slim"),
        File.join('app', 'views', controller_file_path, filename)
      )
    end

    template 'partial.html.slim', File.join('app/views', controller_file_path, "_#{singular_name}.html.slim")
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable Style/ClassAndModuleChildren
