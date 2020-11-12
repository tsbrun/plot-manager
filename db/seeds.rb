stan = User.create(name: "Stan Lee", email: "stan.lee@marvel.com", password: "dccouldnever")
homecoming = Plot.create(title: "Spider-Man: Homecoming", summary: "Best Spider-Man movie ever.")
spidey = Character.create(name: "Peter Parker", role: "Main Protagonist", description: "Nerdy, witty, awkward, likes wearing spandex onesies.")
mj = Character.create(name: "MJ", role: "Main Love Interest", description: "Cool, sarcastic, looks like Zendaya.")

stan.plots << homecoming
homecoming.characters << spidey
homecoming.characters << mj

# , characters: "Spider-Man", summary: "Best Spider-Man movie ever."
# , role: "Main Protagonist", description: "Nerdy, witty, awkward, likes wearing spandex onesies."

# since each instance of Plot has_many :characters, you're not supposed to fill the characters attribute manually. 
# You need to do so through ActiveRecord (e.g., homecoming.characters << spidey)

# delete column in migration "characters" from plots table