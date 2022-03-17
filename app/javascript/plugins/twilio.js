import { connect, createLocalTracks } from 'twilio-video';

const twilioInit = () => {
  const twilioContainer = document.querySelector('.twilio-video');
  const video = document.getElementById('userVideo');
  const leaveBtn = document.getElementById('leave-btn');
  const link = document.querySelector('.root-link')
  const Video = Twilio.Video;
  let videoRoom, localStream;
  // preview screen
  navigator.mediaDevices.getUserMedia({video: true, audio: true})
  .then(vid => {
    console.log('get user media')
    video.srcObject = vid;
    localStream = vid;
    console.log(video)
    leaveBtn.addEventListener('click', () => {
      const tracks = vid.getTracks();
      tracks.forEach(track => track.stop());
    });
  });

  createLocalTracks({
    audio: true,
    video: { width: 640 }
  }).then(localTracks => {
    return connect(twilioContainer.dataset.token, {
      name: twilioContainer.dataset.room,
      tracks: localTracks
    });
  }).then(room => {
    console.log(`Connected to Room: ${room.name}`);
    videoRoom = room;

    room.participants.forEach(participantConnected);
    room.on("participantConnected", participantConnected);

    room.on("participantDisconnected", participantDisconnected);
    room.once("disconnected", (error) =>
      room.participants.forEach(participantDisconnected)
    );
    // leave room
    leaveBtn.addEventListener('click', () => {
      videoRoom.disconnect();
      console.log(`Disconnected from Room ${videoRoom.name}`);
      link.click()
    });
    // twilioAddParticipant(room);
  });
}

const participantConnected = (participant) => {
  console.log(`Participant ${participant.identity} connected'`);

  const div = document.querySelector('.participant') //locates div for new participant
  div.id = participant.sid;

  participant.on('trackSubscribed', track => trackSubscribed(div, track));
  participant.on('trackUnsubscribed', trackUnsubscribed);

  participant.tracks.forEach(publication => {
    if (publication.isSubscribed) {
      trackSubscribed(div, publication.track);
    }
  });
}

const participantDisconnected = (participant) => {
  console.log(`Participant ${participant.identity} disconnected.`);
  document.getElementById(participant.sid).style.visibility = "hidden";
}

const trackSubscribed = (div, track) => {
  div.appendChild(track.attach());
}

const trackUnsubscribed = (track) => {
  track.detach().forEach(element => element.remove());
}

export default twilioInit;
