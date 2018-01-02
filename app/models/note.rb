require 'pry'
class Note < ApplicationRecord
  belongs_to :user

  def self.import(import_file, current_user)
    Note.create(
      body: import_file.read,
      title: File.basename(import_file.original_filename, '.*'),
      user_id: current_user.id
    )
  end

end
