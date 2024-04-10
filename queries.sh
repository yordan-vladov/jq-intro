
printf "1. check if installed\n"
jq

printf "\n2. prettify json\n"
echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' | jq '.'

printf "\n3. apply filter to json file\n"
jq '.' fruit.json

printf "\n4. apply filter to curl response\n"
curl http://api.open-notify.org/iss-now.json | jq '.'

printf "\n5. access fruit properties\n"
jq '.fruit' fruit.json

printf "\n6. access fruit color\n"
jq '.fruit.color' fruit.json

printf "\n7. access fruit color and price\n"
jq '.fruit.color,.fruit.price' fruit.json

printf "\n8. access multiword attribute\n"
echo '{ "with space": "hello" }' | jq '."with space"'

printf "\n9. iterate over array\n"
echo '["x","y","z"]' | jq '.[]'

printf "\n10. get names of fruits\n"
jq '.[] | .name' fruits.json
jq '.[].name' fruits.json

printf "\n11. get price of second fruit\n"
jq '.[1].price' fruits.json

printf "\n12. get slice of array\n"
echo '[1,2,3,4,5,6,7,8,9,10]' | jq '.[6:9]'
echo '[1,2,3,4,5,6,7,8,9,10]' | jq '.[:6]' | jq '.[-2:]'

printf "\n13. get length of object\n"
jq '.fruit | length' fruit.json
jq '.fruit.name | length' fruit.json

printf "\n14. map has function\n"
jq 'map(has("name"))' fruits.json

printf "\n15. map function with transform\n"
jq 'map(.price+2)' fruits.json

printf "\n16. min and max functions\n"
jq '[.[].price] | min' fruits.json
jq '[.[].price] | max' fruits.json

printf "\n16. selecting values\n"
jq '.[] | select(.price>0.5)' fruits.json
jq '.[] | select(.color=="yellow")' fruits.json
jq '.[] | select(.color=="yellow" and .price>=0.5)' fruits.json
jq '.[] | to_entries[] | select(.key | startswith("name")) | .value' fruits.json


printf "\n17. regular expression\n"
jq '.[] | select(.name|test("^a.")) | .price' fruits.json
printf "\n18. unique values\n"
jq 'map(.color) | unique' fruits.json

printf "\n19. deleting keys\n"
jq 'del(.fruit.name)' fruit.json

printf "\n20. transforming json\n"
jq '.query.pages | [.[] | map(.) | .[] | {page_title: .title, page_description: .extract}]' wikipedia.json
