bot.command(:character, min_args: 1) do |event, *args|
  character_name = args.join(' ')
  response = RestClient.get("https://xivapi.com/character/search?name=#{character_name}%22")

  character_data = JSON.parse(response.body)['Results'].first
  
  if character_data.nil?
    event.respond("No character found with the name #{character_name}")
  else
    character_id = character_data['ID']
    response = RestClient.get("https://xivapi.com/character/#{character_id}%22")
  
    character_info = JSON.parse(response.body)

    event.respond("Name: #{character_info['Character']['Name']}\nLevel: #{character_info['Character']['Level']}\nServer: #{character_info['Character']['Server']}")
  end
end
