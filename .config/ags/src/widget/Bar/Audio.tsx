import { createBinding } from "ags";
import AstalWp from "gi://AstalWp?version=0.1";

export const Audio = () => {
  const speaker = AstalWp.get_default()?.audio.defaultSpeaker!;

  return (
    <box class="audio">
      <image iconName={createBinding(speaker, "volumeIcon")} pixelSize={14} />
      <label label={createBinding(speaker, "volume").as(v => `${Math.floor(v * 100)}%`)} />
      {/* <slider */}
      {/*   widthRequest={} */}
      {/*   onDragged={({ value }) => (speaker.volume = value)} */}
      {/*   value={bind(speaker, "volume")} */}
      {/* /> */}
    </box>
  );
};
