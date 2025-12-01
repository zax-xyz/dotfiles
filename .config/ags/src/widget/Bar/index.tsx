import { onCleanup } from "ags";
import app from "ags/gtk4/app";
import Astal from "gi://Astal?version=4.0";
import Gdk from "gi://Gdk?version=4.0";

import { Audio } from "./Audio";
import { Battery } from "./Battery";
import { Media } from "./Media";
import { SysTray } from "./SysTray";
import { Time } from "./Time";
import { Workspaces } from "./Workspaces";
import { Gtk } from "ags/gtk4";

type SectionProps = Pick<JSX.IntrinsicElements["box"], "$type" | "children">;
const Section = (props: SectionProps) => (
  <box
    $type={props.$type}
    class="min-h-8 rounded-sm *:bg-ctp-base *:px-3.5 *:py-1 *:rounded-lg"
    spacing={8}
  >
    {props.children}
  </box>
);

export const Bar = ({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) => {
  let win: Astal.Window;
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  onCleanup(() => {
    // Root components (windows) are not automatically destroyed.
    // When the monitor is disconnected from the system, this callback
    // is run from the parent <For> which allows us to destroy the window
    win.destroy();
  });

  return (
    <window
      $={self => (win = self)}
      class="text-ctp-text pb-2 font-[rubik] text-sm drop-shadow"
      visible
      namespace="ags-bar"
      name={`bar-${gdkmonitor.connector}`}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <box orientation={Gtk.Orientation.VERTICAL}>
        <centerbox class="px-4 py-1.5 bg-ctp-crust main" hexpand>
          <Section $type="start">
            <Workspaces />
            <Media />
          </Section>
          <Section $type="center">
            <Time />
          </Section>
          <Section $type="end">
            <SysTray />
            <Audio />
            <Battery />
          </Section>
        </centerbox>
        <centerbox>
          <box
            $type="start"
            class="min-w-2 min-h-2 bg-radial-[at_100%_100%] from-transparent to-ctp-crust from-[7px] to-0%"
          ></box>
          <box
            $type="end"
            class="min-w-2 min-h-2 bg-radial-[at_0_100%] from-transparent to-ctp-crust from-[7px] to-0%"
          ></box>
        </centerbox>
      </box>
    </window>
  );
};
