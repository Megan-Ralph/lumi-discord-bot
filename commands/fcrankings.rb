bot.command(:fcrankings, description: 'Get the Free Company rankings for a server', min_args: 1) do |event, *args|
  server_name = args.join(' ')
  fc_rankings = get_fc_rankings(server_name)
  fc_rankings_str = fc_rankings.map { |fc| "#{fc[:rank]}. #{fc[:name]} - #{fc[:member_count]} members" }.join("\n")

  event.respond("Free Company Rankings for #{server_name}:\n#{fc_rankings_str}")
end
