App.draft = App.cable.subscriptions.create('DraftChannel', {
  connected: function() {
    return console.log('me conecte');
  },
  received: function(data) {
    switch (data.action) {
      case "update_draft":
        return $('#team-'+data.team_id).append($('#waiting-' + data.user_id));
      case "create_attendee":
        return $('#waiting_list').append('<li id="waiting-' + data.user_id + '" class="team-member"><figure class="img-circle img-fluid"><img src="' + data.picture_url + '" alt="1312687?v=3"></figure><p class="team-member-name">' + data.name + '</p></li>');
      case "update_turn":
        if ($('#choose_problem').length) {
          return true;
        }else {
          return Turbolinks.visit(window.location.toString());
        }
    }
  }
});
