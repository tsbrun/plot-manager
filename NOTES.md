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