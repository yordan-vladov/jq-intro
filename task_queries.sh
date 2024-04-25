# намерете всичките потребителски имена
jq '.[].username' users.json

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.roles[] == "admin") | .name' users.json

# намерете броя потребители, които имат повече от една роля
jq '[.[] | select(length(.roles) > 1)] | length' users.json

# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.birthdate | startswith("90")) | .name' users.json

# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.location.latitude >= 0) | .name' users.json

# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.workplace == "Arctiq") | .name' users.json

# намерете броя потребители, които са родени преди 1990
jq '[.[] | select(.birthdate | tonumber < 1990)] | length' users.json

# намерете името на най-старият потребител
jq '[.[] | select(.birthdate == ([.[] | .birthdate | tonumber] | max))][0].name' users.json

# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.about == null) | .name' users.json
