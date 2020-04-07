class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  validates :content, presence: true

  def as_json(options = {})

    email = user.email

    {
      id: id,
      email: email,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end

end
