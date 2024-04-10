# намерете всичките потребителски имена
[
    {"$project": {"_id": 0, "username": 1}}
]

# намерете имената на всичките потребители, които имат роля админ
[
    {"$match": {"roles": "admin"}},
    {"$project": {"_id": 0, "username": 1}}
]

# намерете броя потребители, които имат повече от една роля
[
    {"$match": {"$expr": {"$gt": [{"$size": "$roles"}, 1]}}},
    {"$count": "users_with_multiple_roles"}
]

# намерете имената на потребителите, родени през 90-те
[
    {"$match": {"profile.dob": {"$regex": "^199[0-9]-"}}},
    {"$project": {"_id": 0, "username": 1}}
]

# намерете имената на потребителите, които живеят в северното полукълбо
[
    {"$match": {"profile.location.lat": {"$gt": 0}}},
    {"$project": {"_id": 0, "username": 1}}
]

# намерете имената на потребителите, които работят в 'Arctiq'
[
    {"$match": {"profile.company": "Arctiq"}},
    {"$project": {"_id": 0, "username": 1}}
]

# намерете броя потребители, които са родени преди 1990
[
    {"$match": {"profile.dob": {"$lt": "1990-01-01"}}},
    {"$count": "users_born_before_1990"}
]

# намерете името на най-старият потребител
[
    {"$sort": {"profile.dob": 1}},
    {"$limit": 1},
    {"$project": {"_id": 0, "username": 1}}
]

# намерете имената на потребителите с празно 'about' поле
[
    {"$match": {"profile.about": ""}},
    {"$project": {"_id": 0, "username": 1}}
]
