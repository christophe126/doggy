const twilioAddParticipant = () => {
  // Attach the Participant's Media to a <div> element.
  room.on('participantConnected', participant => {
    console.log(`Participant "${participant.identity}" connected`);
    participant.tracks.forEach(publication => {
      if (publication.isSubscribed) {
        const track = publication.track;
        document.getElementById('remote-media-div').appendChild(track.attach());
      }
    });
    participant.on('trackSubscribed', track => {
      document.getElementById('remote-media-div').appendChild(track.attach());
    });
  });
  }
  export default twilioAddParticipant;
