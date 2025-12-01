import { createBinding, With } from "ags";
import { Gtk } from "ags/gtk4";
import AstalMpris from "gi://AstalMpris?version=0.1";

import { pathToURI } from "../../utils";

export const Media = () => {
  const mpris = AstalMpris.get_default();

  const players = createBinding(mpris, "players");

  return (
    <box class="media">
      <With value={players}>
        {players => {
          const player =
            players.find(p => p.playbackStatus === AstalMpris.PlaybackStatus.PLAYING) ??
            players.find(p => p.bus_name === "org.mpris.MediaPlayer2.spotify") ??
            players[0];
          return player ? (
            <box spacing={6}>
              <box
                class="cover"
                valign={Gtk.Align.CENTER}
                css={createBinding(player, "coverArt").as(
                  cover => `background-image: url('${pathToURI(cover)}');`,
                )}
              />
              <label
                label={createBinding(player, "metadata").as(() => {
                  const fullLabel = player ? `${player.artist} - ${player.title}` : "";
                  const maxLength = 30;
                  return (fullLabel?.length ?? 0) > maxLength
                    ? `${fullLabel?.slice(0, maxLength)}...`
                    : fullLabel;
                })}
              />
            </box>
          ) : (
            <label label="Nothing Playing" />
          );
        }}
      </With>
    </box>
  );
};
