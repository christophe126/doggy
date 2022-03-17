class Booking < ApplicationRecord
  belongs_to :pension
  belongs_to :user_basket
  belongs_to :user

  def set_room_name
    client = Twilio::REST::Client.new(ENV["KEY_ID"], ENV["AUTH_TOKEN"])
    room = client.video.rooms.create(unique_name: "#{proposal.name}_#{Time.now.to_i}")
    self.url_room = room.unique_name
  end

end
