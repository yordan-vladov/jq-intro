# намерете всичките потребителски имена
jq '.[].username' users.json

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.role == "admin") | .username' users.json

# намерете броя потребители, които имат повече от една роля
jq '[.[] | select(.roles | length > 1)] | length' users.json

# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.birthdate | test("^[0-9]{4}-9[0-9]") ) | .username' users.json

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.location.latitude > 0) | .username' users.json

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.company == "Arctiq") | .username' users.json

# намерете броя потребители, които са родени преди 1990
jq '[.[] | select(.birthdate | startswith("199"))) ] | length' users.json

# намерете името на най-старият потребител
jq 'max_by(.birthdate) | .username' users.json

# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.about == "") | .username' users.json
