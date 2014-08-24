class RpiIp < ActiveRecord::Base
  attr_accessible :ip, :ping, :rpi_id
end
