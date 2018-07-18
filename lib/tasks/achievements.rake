namespace :achievements do
  desc 'Create Default Achievements'
  task create_default_achievements: :environment do
    print 'Creating Achievements...'
    acheivements = [
      {name: 'Party Parrot', description: '10 Unique (not on the same day) Logins', icon_name: 'bronze-min.png'},
      {name: 'Party Corgi', description: '100 Unique (not on the same day) Logins', icon_name: 'silver-min.png'},
      {name: 'Party Wizard', description: '1000 Unique (not on the same day) Logins', icon_name: 'gold-min.png'},
      {name: 'Pest Control', description: 'Resolved an issue labeled &quot;Bug&quot; on GitHub', icon_name: 'bug-min.png'},
      {name: 'Founder', description: 'One of the first 100 contributers to devSR', icon_name: 'goblet-min.png'},
      {name: 'Lifesaver', description: 'Resolved an issue labeled &quot;Urgent&quot; on GitHub', icon_name: 'lifesaver-min.png'},
      {name: 'Lightbulb', description: 'Came up with an idea for devSR that got implemented', icon_name: 'lightbulb-min.png'}
    ]

    Achievement.create(acheivements);
    puts 'Done.'
  end

end
