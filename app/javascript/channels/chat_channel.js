// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    const currentUserId = $('#current_user_id').attr('current_user_id')
    const subjectId = $('#subject_id').attr('subject_id')

    consumer.subscriptions.create(
      {
        channel: "ChatChannel",
        subject_id: subjectId
      },
      {
        connected() {
          // Called when the subscription is ready for use on the server
        },
  
        disconnected() {
          // Called when the subscription has been terminated by the server
        },
  
        received(data) {
          const dataUserId = data.current_user_id
          const bell = $('#bell')
          if(dataUserId !== currentUserId) {
            bell.removeClass("d-none")
          }
        }
      }
    );
  });
  