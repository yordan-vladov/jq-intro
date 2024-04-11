# намерете всичките потребителски имена
cat data.json | jq '.[].username'

# намерете имената на всичките потребители, които имат роля админ
cat data.json | jq '.[] | select(.roles | index("admin")) | .profile.name'

# намерете броя потребители, които имат повече от една роля
cat data.json | jq '[.[] | select(.roles | length > 1)] | length'

# намерете имената на потребителите, родени през 90-те
cat data.json | jq '.[] | select(.profile.dob | startswith("199")) | .profile.name'

# намерете имената на потребителите, които живеят в северното полукълбо
cat data.json | jq '.[] | select(.profile.location.lat < 0) | .profile.name'

# намерете имената на потребителите, които работят в 'Arctiq'
cat data.json | jq '.[] | select(.profile.company == "Arctiq") | .profile.name'

# намерете броя потребители, които са родени преди 1990
cat data.json | jq 'max_by(.profile.dob) | .profile.name'

# намерете името на най-старият потребител
cat data.json | jq 'max_by(.profile.dob) | .profile.name'

# намерете имената на потребителите с празно 'about' поле
cat data.json | jq '.[] | select(.profile.about == "") | .profile.name'
