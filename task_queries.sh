# намерете всичките потребителски имена
jq '.[] .username' data.json

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.roles[] | contains("admin")) | .username' data.json

# намерете броя потребители, които имат повече от една роля
jq '.[] | select(.roles | length > 1) | .username' data.json

# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.profile.dob | startswith("199")) | .profile.name' data.json

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.profile.location.lat < 0) | .profile.name' data.json

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.profile.company == "Arctiq") | .profile.name' data.json

# намерете броя потребители, които са родени преди 1990
jq '[.[] | select((.profile.dob | split("-")[0] | tonumber) < 1990) ] | length' data.json

# намерете името на най-старият потребител
jq '[.[] | {name: .profile.name, dob: .profile.dob} ] | sort_by(.dob) | .[0].name' data.json

# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.profile.about == "") | .profile.name' data.json
