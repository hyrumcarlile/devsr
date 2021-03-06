require 'faker'
require 'ruby-progressbar'
namespace :simulate do
  desc 'Simulate a day (add users, endorsements, etc.)'
  task day: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    ActiveRecord::Base.establish_connection
    counter = SimulatedDay.count
    num_days = ARGV[1].to_i
    suppress_text = (ARGV[2] == "suppress_text")
    pbar = ProgressBar.create(total: num_days) if suppress_text
    num_days.times do
      new_users = create_new_users
      new_endorsements = create_new_endorsements
      new_notes = create_new_notes
      new_votes = create_new_votes
      new_achievements = create_new_achievements
      create_simulated_day(new_users, new_endorsements, new_notes, new_votes)
      counter += 1
      puts "Day #{counter}:
            New Users: #{new_users}
            New Endorsements: #{new_endorsements}
            New Notes: #{new_notes}
            New Votes: #{new_votes}
            New Achievementes: #{new_achievements}
            ==============================
            Total Users: #{User.count}
            Total Endorsements: #{Endorsement.count}
            Total Notes: #{Note.count}
            Total Votes: #{Vote.count}
            Total Achievements: #{total_achievements}
            **************************************************************" unless suppress_text
      pbar.increment if pbar
    end
  end

  desc 'Simulate 7 days (add users, endorsements, etc.)'
  task week: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    ARGV.push("7").push("suppress_text")
    Rake::Task['simulate:day'].invoke
  end

  desc 'Simulate 31 days (add users, endorsements, etc.)'
  task month: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    ARGV.push("31").push("suppress_text")
    Rake::Task['simulate:day'].invoke
  end

  desc 'Simulate 90 days (add users, endorsements, etc.)'
  task quarter: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    ARGV.push("90").push("suppress_text")
    Rake::Task['simulate:day'].invoke
  end

  desc 'Simulate 365 days (add users, endorsements, etc.)'
  task year: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    ARGV.push("365").push("suppress_text")
    Rake::Task['simulate:day'].invoke
  end

  def create_new_users
    counter = 0
    if SimulatedDay.count.eql?(0)
      10.times do
        create_user
        counter += 1
      end
    else
      users_algorithm.times do
        create_user
        counter += 1
      end
    end
    counter
  end

  def create_new_endorsements
    counter = 0
    endorsements_algorithm.times do
      create_endorsement
      counter += 1
    end
    counter
  end

  def create_new_notes
    counter = 0
    notes_algorithm.times do
      create_note
      counter+= 1
    end
    counter
  end

  def create_new_votes
    counter = 0
    votes_algorithm.times do
      create_vote
      counter += 1
    end
    counter
  end

  def create_new_achievements
    counter = 0
    achievements_algorithm.to_i.times do
      create_achievement
      counter += 1
    end
    counter
  end

  def create_simulated_day(new_users, new_endorsements, new_notes, new_votes)
    SimulatedDay.create!(
      num_new_users: new_users,
      num_new_endorsements: new_endorsements,
      num_new_notes: new_notes,
      num_new_votes: new_votes
    )
  end

  def create_endorsement
    begin
      endorser_id = ([*1..User.count]).sample
      endorsee_id = ([*1..User.count]).sample
      endorsee = User.find(endorsee_id)
      srs = endorsee.skill_ratings.sort_by() { |sr| sr.rating }.reverse!

      # This basically says "if a user doesn't have a skill, pick a random skill."
      # "if they do have skills, it has a 33% chance of picking their most endorsed
      # skill, then, a 33% chance of picking their second most endorsed skill.
      # And so on...

      if srs.blank?
        skill_id = ([*1..Skill.count]).sample
      else
        srs.each do |sr|
          if ([*1..3]).sample == 1
            skill_id = sr.skill.id
            break
          end
        end
      end
      skill_id = ([*1..Skill.count]).sample if skill_id.nil?

      Endorsement.create!(
          endorser_id: endorser_id,
          endorsee_id: endorsee_id,
          skill_id: skill_id
      )

    # For duplicate endorsements
    rescue NameError
    rescue PG::UniqueViolation
    rescue ActiveRecord::RecordNotUnique
    # For endorsing yourself
    rescue ActiveRecord::RecordInvalid
    # For Users that can't be found
    rescue ActiveRecord::RecordNotFound
    end
  end

  def create_user
    pw = Faker::Internet.password(6, 12)
    name = Faker::Name.name
    email = Faker::Internet.unique.free_email(name)
    User.create!(
      email: email,
      password: pw,
      password_confirmation: pw,
      name: name,
      username: Faker::Internet.unique.user_name(name),
      avatar_url: "https://robohash.org/#{email}?gravatar=yes"
    )
  end

  def create_note
    title = Faker::Lorem.sentence(3, true, 4)
    body = Faker::Lorem.paragraph(rand(7..15), true, rand(1..5))
    rand(0..15).times do
      body += "\n\n#{Faker::Lorem.paragraph(rand(7..15), true, rand(1..5))}"
    end
    Note.create!(
      title: title,
      body: body,
      user_id: rand(1..User.count)
    )
  end

  def create_vote
    return if Note.count < 1
    Vote.create!(
      note_id: rand(1..Note.count),
      user_id: rand(1..User.count),
      is_upvote?: true
    )
  end

  def create_achievement
    begin
      User.find(rand(1..User.count)).achievements << Achievement.find(rand(1..Achievement.count))
    # For duplicate achievements
    rescue NameError
    rescue PG::UniqueViolation
    rescue ActiveRecord::RecordNotUnique
    end
  end

  def users_algorithm
    ((SimulatedDay.count / 10) * rand(0.5..1.5)).round
  end

  def endorsements_algorithm
    ((User.count / 15) * rand(0.5..1.5)).round
  end

  def notes_algorithm
    ((User.count / 30) * rand(0.5..1.5)).round
  end

  def votes_algorithm
    ((User.count / 3) * rand(0.5..1.5)).round
  end

  def achievements_algorithm
    (User.count.to_f / 100.to_f) + (rand(1..50) == 1 ? 1 : 0)
  end

  def total_achievements
    ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM \"achievements_users\"").values[0][0]
  end
end
