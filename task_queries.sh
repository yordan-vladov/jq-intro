# намерете всичките потребителски имена
jq '.[] | .username' data.json;

# намерете имената на всичките потребители, които имат роля админ
jq '.[] | select(.roles[] == "admin") | .username' data.json


# намерете броя потребители, които имат повече от една роля
jq '[.[] | select(.roles | length > 1)] | length' data.json;


# намерете имената на потребителите, родени през 90-те
jq '.[] | select(.dob | test("^199")) | .name' data.json;


# намерете имената на потребителите, които живеят в северното полукълбо
jq '.[] | select(.address.latitude > 0) | .name' data.json;


# намерете имената на потребителите, които работят в 'Arctiq'
jq '.[] | select(.company == "Arctiq") | .name' data.json;


# намерете броя потребители, които са родени преди 1990
jq '[.[] | select(.dob | test("^(19[0-8]"))] | length' data.json;


# намерете името на най-старият потребител
jq 'min_by(.dob) | .name' data.json;


# намерете имената на потребителите с празно 'about' поле
jq '.[] | select(.about | length == 0) | .name' data.json;
