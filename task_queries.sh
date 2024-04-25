# намерете всичките потребителски имена
jq '.[].username' data.json

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.roles[] == "admin") | .profile.name' data.json

# намерете броя потребители, които имат повече от една роля
jq '[.[] | select(length(.roles) > 1)] | length' data.json

# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.profile.dob | startswith("199")) | .profile.name' data.json

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.profile.location.lat < 0) | .profile.name' data.json

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.profile.company == "Arctiq") | .profile.name' data.json

# намерете броя потребители, които са родени преди 1990
jq '[.[] | select(.profile.dob | strptime("%Y-%m-%d") < "1990-01-01") ] | length' data.json

# намерете името на най-старият потребител
jq '[.[] | select(.profile.dob | strptime("%Y-%m-%d")) | .profile | {name: .name, dob: .dob} ] | sort_by(.dob) | .[0].name' data.json

# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.profile.about == "") | .profile.name' data.json
