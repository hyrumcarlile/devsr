class AddNoteToEndorsements < ActiveRecord::Migration[5.0]
  def change
    add_reference :endorsements, :note, foreign_key: true
  end
end
