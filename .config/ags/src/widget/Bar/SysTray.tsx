import { createBinding, For } from "ags";
import { Gtk } from "ags/gtk4";
import AstalTray from "gi://AstalTray";

import { MenuButton } from "../../components/MenuButton";

export const SysTray = () => {
  const tray = AstalTray.get_default();
  const items = createBinding(tray, "items");

  const init = (btn: Gtk.MenuButton, item: AstalTray.TrayItem) => {
    btn.menuModel = item.menuModel;
    btn.insert_action_group("dbusmenu", item.actionGroup);
    item.connect("notify::action-group", () => {
      btn.insert_action_group("dbusmenu", item.actionGroup);
    });
  };

  return (
    <box valign={Gtk.Align.CENTER}>
      <For each={items}>
        {item => (
          <MenuButton class="*:px-1.5 *:py-0 *:outline-none" $={self => init(self, item)}>
            <image gicon={createBinding(item, "gicon")} pixelSize={14} />
          </MenuButton>
        )}
      </For>
    </box>
  );
};
