maintainer        "Semmy Purewal"
maintainer_email  "semmypurewal@gmail.com"
license           "Apache 2.0"
description       "Installs redis-server package"
version           "1.0.0"
recipe            "redis-server", "installs redis-server package"

%w{ ubuntu }.each do |os|
  supports os
end
