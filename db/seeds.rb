stan = User.create(name: "Stan Lee", email: "stan.lee@marvel.com", password: "dccouldnever")
homecoming = Plot.create(title: "Spider-Man: Homecoming", summary: "Best Spider-Man movie ever.")
spidey = Character.create(name: "Peter Parker", role: "Main Protagonist", description: "Nerdy, witty, awkward, likes wearing spandex onesies.")
mj = Character.create(name: "MJ", role: "Main Love Interest", description: "Cool, sarcastic, looks like Zendaya.")

stan.plots << homecoming
homecoming.characters << spidey
homecoming.characters << mj