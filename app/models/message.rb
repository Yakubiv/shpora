class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recepient, class_name: 'User', foreign_key: 'recepient_id'



  def read
    self.read_at = true
  end

end
