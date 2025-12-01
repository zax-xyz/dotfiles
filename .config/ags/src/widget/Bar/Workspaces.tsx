import { createBinding, With } from "ags";
import { Gtk } from "ags/gtk4";
import clsx from "clsx";
import AstalHyprland from "gi://AstalHyprland";

export const Workspaces = () => {
  const hypr = AstalHyprland.get_default();
  const workspaces = createBinding(
    hypr,
    "workspaces",
  )(workspaces => new Set(workspaces.map(ws => ws.id)));

  return (
    <box class="workspaces">
      <With value={workspaces}>
        {workspaces => (
          <box>
            {[...Array(10).keys()].map(i => {
              const ws = AstalHyprland.Workspace.dummy(i + 1, null);
              return (
                <button
                  valign={Gtk.Align.CENTER}
                  class={createBinding(hypr, "focusedWorkspace").as(fw =>
                    clsx("px-1", {
                      focused: i + 1 === fw.id,
                      occupied: workspaces.has(i + 1),
                    }),
                  )}
                  onClicked={() => ws.focus()}
                >
                  <box class="indicator" valign={Gtk.Align.CENTER} halign={Gtk.Align.START} />
                </button>
              );
            })}
          </box>
        )}
      </With>
    </box>
  );
};
