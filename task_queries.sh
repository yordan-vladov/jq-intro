# намерете всичките потребителски имена
jq '.[].username' data.json

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.roles | contains(["admin"])) | .username' data.json

# намерете броя потребители, които имат повече от една роля
jq '[.[] | select(.roles | length > 1)] | length' data.json

# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.profile.dob | startswith("199")) | .username' data.json

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.profile.location.lat < 0) | .username' data.json

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.profile.company == "Arctiq") | .username' data.json

# намерете броя потребители, които са родени преди 1990
jq '[.[] | select(.profile.dob | strptime("%Y-%m-%d") | mktime < mktime("1990-01-01T00:00:00Z"))] | length' data.json

# намерете името на най-старият потребител
jq 'min_by(.profile.dob) | .username' data.json

# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.profile.about == "") | .username' data.json
