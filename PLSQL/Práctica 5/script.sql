-- 0. 
match(n) detach delete n;

-- 1.
CREATE (philip:Person{name:"Philip"}) - [f1:IS_FRIEND_OF] -> (mark:Person{name:"Mark"}) - [l1:LIKES] -> (zushi:Restaurant{name:"Zushi Zam"})
- [:LOCATED_IN] -> (city:City{location:"New York"}), (zushi)-[s1:SERVES] -> (d_sushi:Dish{cuisine:"Sushi"}), (philip) - [f2:IS_FRIEND_OF] -> (bruno:Person{name:"Bruno"}) - [l2:LIKES] -> (isushi: Restaurant{name:"iSushi"}) - [s2:SERVES] -> (d_sushi), (isushi) - [:LOCATED_IN] -> (city)
return *;

-- 2. 
match (n) return *;

-- 3. 
match (p:Person) - [:IS_FRIEND_OF] -> (friends:Person) - [:LIKES] -> () - [:SERVES] -> (d_sushi:Dish) 
where p.name = "Philip" and d_sushi.cuisine = "Sushi"
return friends;

-- 4. 
match (r:Restaurant)
where r.name CONTAINS "ushi"
return r;

-- 5. 
match (r:Restaurant)-[:SERVES]->(d_sushi:Dish)
where d_sushi.cuisine = "Sushi"
return r;

-- 6. 
match (city:City)
where city.location = "New York"
create (new_r:Restaurant{name:"iPizza"})-[:LOCATED_IN]->(city), (new_r)-[s:SERVES]->(new_d:Dish{cuisine:"Pizza"})
return new_r, new_d, city, s;

-- 7. 
match (r:Restaurant)
where r.name = "Zushi Zam"
set r.name = "Zushi"
return r;

-- 8. 
match (c:City)
where c.location = "New York"
set c.country = "USA"
return c;

-- 9. 
match (p:Person) - [:IS_FRIEND_OF] -> (f:Person) - [:LIKES] -> (r:Restaurant) - [s:SERVES] -> (dish:Dish), (r) - [:LOCATED_IN] -> (c:City) 
where p.name = "Philip" and dish.cuisine = "Sushi" and c.location = "New York"
create (d:Dish{cuisine:"Sashimi"}), (r)-[:SERVES]->(d)
return *;

-- 10. 
match (p:Person) - [*3] -> (m)
where p.name = "Philip"
return m;

-- 11. 
match ()-[l:LOCATED_IN]-(c:City)
where c.location = "New York"
detach delete l,c;