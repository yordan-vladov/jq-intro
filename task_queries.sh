# намерете всичките потребителски имена
printf "\n1. all usernames:"
jq '.[] | .username' data.json

# намерете имената на всичките потребители, които имат роля админ
printf "\n2. admins:"
jq '.[] | select(.roles | contains(["admin"])) | .profile.name' data.json

# намерете броя потребители, които имат повече от една роля
printf "\n3. numbers of users with >1 roles:"
jq '[.[] | select(length(.roles) > 1)] | length' data.json

# намерете имената на потребителите, родени през 90-те
printf "\n4. users born in the 90s:"
jq '.[] | select(.profile.dob | startswith("199")) | .profile.name' data.json

# намерете имената на потребителите, които живеят в северното полукълбо
printf "\n5. users living in the northern hemisphere:"
jq '.[] | select(.profile.location.lat >= 0) | .profile.name' data.json

# намерете имената на потребителите, които работят в 'Arctiq'
printf "\n6. users working at 'Arctiq':"
jq '.[] | select(.profile.company == "Arctiq") | .profile.name' data.json

# намерете броя потребители, които са родени преди 1990
printf "\n7. users born before 1990:"
jq '.[] | select(.profile.dob | strptime("%Y-%m-%d") | .[0] < 1990) | .profile.name' data.json

# намерете името на най-старият потребител
printf "\n8. oldest user:"
jq 'min_by(.profile.dob) | .profile.name' data.json

# намерете имената на потребителите с празно 'about' поле
printf "\n9. users with empty 'about' field:"
jq '.[] | select(.profile.about == "") | .profile.name' data.json