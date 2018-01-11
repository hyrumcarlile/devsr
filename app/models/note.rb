require 'pry'
class Note < ApplicationRecord
  belongs_to :user

  def self.import(import_file, current_user)
    n = Note.new(
      body: import_file.read,
      title: File.basename(import_file.original_filename, '.*'),
      user_id: current_user.id
    )
  end

  def self.sanitize_html (note)
    # Remove ascii characters from the string to prevent "�" from showing
    note.body.encode!("UTF-8", :invalid => :replace, :undef => :replace, :replace => "")
    # Sanitize uploaded html through a whitelist of html tags
    note.body = Sanitize.fragment(note.body, Sanitize::Config.merge(Sanitize::Config::BASIC,
     :elements        => Sanitize::Config::RELAXED[:elements] + ['div', 'br'],
     :remove_contents => true,
    ))
    note.body.prepend("<div class=\"note\">")
    note.body += '</div>'
    note
  end

end
