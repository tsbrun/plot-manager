# the following code was in plots/index

<ul>
        <% plot.characters.each do |character| %>
            <ul> 
                <li><a href="/characters/<%= character.id %>"><%= character.name %></a></li>
                <li><%= character.role %></li>
                <li><%= character.description %></li>
            </ul>
        <% end %>
        <li><p><%= plot.summary%></p></li>
    </ul>

    <h1>Create a New Character</h1>

<form method="POST" action="/plots/<%= @plot.id %>/characters">
<label for="name">Name: </label>
<input type="text" name="name"><br><br>

<label for="name">Role: </label>
<input type="text" name="role"><br><br>

<label for="name">Description: </label>
<textarea name="description"></textarea><br><br>

<input value="<%  %>">

<input type="submit" value="Create">
</form>