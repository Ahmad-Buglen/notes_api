class NoteWorker
  include Sidekiq::Worker
  require 'fcm'
 

  def perform(note_id)
    note = Note.find(note_id)

    fcm = FCM.new("AAAAoSCSkMo:APA91bEhSq3uUyYo7otFgafGcIy-2BsHSzNoHPrZkVG0PQlFWoNIRpHA0vqY-b94OXzUT0jCK2qK4l1cOVPh8CzlBeFu1KpUtCAQKmpBZO2dstVLQdHX_HycmwJw2Rdx_GTMAsJhio3D")
    
    registration_ids= [note.admin_user.mobile_token] 
    options = { "notification": {
                  "title": note.name,
                  "body": note.description
              }
    }
    response = fcm.send(registration_ids, options)
  end

end