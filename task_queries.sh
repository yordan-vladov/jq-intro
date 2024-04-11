# намерете всичките потребителски имена
jq '.users[].username'

# намерете имената на всичките потребители, които имат роля админ
jq '.users[] | select(.roles | contains(["admin"])) | .username'

# намерете броя потребители, които имат повече от една роля
jq '[.users[] | select(.roles | length > 1)] | length'

# намерете имената на потребителите, родени през 90-те
jq '.users[] | select(.profile.dob | startswith("199")) | .username'

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.users[] | select(.profile.location.lat < 0) | .username'

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.users[] | select(.profile.company == "Arctiq") | .username'

# намерете броя потребители, които са родени преди 1990
jq '[.users[] | select(.profile.dob | split("-")[0] | tonumber < 1990)] | length'

# намерете името на най-старият потребител
jq '.users | min_by(.profile.dob) | .username'

# намерете имената на потребителите с празно 'about' поле
jq '.users[] | select(.profile.about == "") | .username'
