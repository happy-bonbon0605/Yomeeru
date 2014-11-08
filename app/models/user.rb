class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provier']
      user.uid      = auth['uid']
      username      = auth['info']['nickname']
    end
  end
end
