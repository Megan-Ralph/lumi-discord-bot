require 'discordrb'
require 'rufus-scheduler'
require 'rest-client'
require 'json'

require_relative 'commands'

config = YAML.load_file('config.yml')

bot = Discordrb::Commands::CommandBot.new(
  token: config['discord_bot_token'],
  client_id: config['discord_bot_client_id'],
  predix: '!'
)

def get_fc_rankings(server)
  response = RestClient.get("https://xivapi.com/freecompany/search?server=#{server}&order=member_count%22")
  fc_data = JSON.parse(response.body)['Results']

  fc_data.map.with_index do |fc, i|
    { rank: i + 1, name: fc['Name'], member_count: fc['MemberCount'] }
  end
end

bot.run
