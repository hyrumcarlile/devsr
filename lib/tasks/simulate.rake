namespace :simulate do
  desc 'Simulate a day (add users, endorsements'
  task day: :environment do
    # This is to not get an error because rails will look for
    # a task for each arg in ARGV
    ARGV.each { |a| task a.to_sym do ; end }
    counter = SimulatedDay.count
    ARGV[1].to_i.times do
      new_users = create_new_users
      new_endorsements = create_new_endorsements
      create_simulated_day(new_users, new_endorsements)
      counter += 1
      puts "Day #{counter}:
            New Users: #{new_users}
            New Endorsements: #{new_endorsements}
            ==============================
            Total Users: #{User.count}
            Total Endorsements: #{Endorsement.count}
            **************************************************************"
    end
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

  def create_simulated_day(new_users, new_endorsements)
    SimulatedDay.create!(
      num_new_users: new_users,
      num_new_endorsements: new_endorsements
    )
  end

  def create_endorsement
    begin
      Endorsement.create!(
          endorser_id: ([*1..User.count]).sample,
          endorsee_id: ([*1..User.count]).sample
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
    User.create!(
      email: Faker::Internet.unique.email(name),
      password: pw,
      password_confirmation: pw,
      name: name,
      username: Faker::Internet.unique.user_name(name)
    )
  end

  def users_algorithm
    ((SimulatedDay.count / 10) * rand(0.5..1.5)).round
  end

  def endorsements_algorithm
    ((User.count / 15) * rand(0.5..1.5)).round
  end
end
