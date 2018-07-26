class Note < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :votes

  validates_presence_of :title
  validates_presence_of :body

  friendly_id :title, use: [:slugged, :history, :finders]

  def created_at_display
    if created_at.to_date == Time.now.to_date
      num_hours = ((Time.now - created_at) / 1.hours).to_i
      return "#{ActionController::Base.helpers.pluralize(num_hours, 'hour')} ago"
    else
      num_days = (Time.now.to_date - created_at.to_date).to_i
      return "#{ActionController::Base.helpers.pluralize(num_days, 'day')} ago"
    end
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

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

  def should_show_upvote_btn(current_user)
    # display an inactive (or disabled) button if the user has already upvoted that note
    return false if self.votes.map(&:user).include? current_user
    # else, return a regular button
    return true
  end
end
