name              "redis-server"
maintainer        "Semmy Purewal"
maintainer_email  "me@semmy.me"
license           "Apache 2.0"
description       "Installs redis-server package"
version           "1.0.0"
recipe            "redis-server", "installs redis-server package"

%w{ ubuntu }.each do |os|
  supports os
end
