import { createBinding, For, With } from "ags";
import { Gtk } from "ags/gtk4";
import { execAsync } from "ags/process";
import AstalNetwork from "gi://AstalNetwork";

export const Wireless = () => {
  const network = AstalNetwork.get_default();
  const wifi = createBinding(network, "wifi");

  const sorted = (arr: Array<AstalNetwork.AccessPoint>) => {
    return arr.filter(ap => !!ap.ssid).sort((a, b) => b.strength - a.strength);
  };

  async function connect(ap: AstalNetwork.AccessPoint) {
    // connecting to ap is not yet supported
    // https://github.com/Aylur/astal/pull/13
    try {
      await execAsync(`nmcli d wifi connect ${ap.bssid}`);
    } catch (error) {
      // you can implement a popup asking for password here
      console.error(error);
    }
  }

  return (
    <box visible={wifi(Boolean)}>
      <With value={wifi}>
        {wifi =>
          wifi && (
            <menubutton>
              <image iconName={createBinding(wifi, "iconName")} />
              <popover>
                <box orientation={Gtk.Orientation.VERTICAL}>
                  <For each={createBinding(wifi, "accessPoints")(sorted)}>
                    {(ap: AstalNetwork.AccessPoint) => (
                      <button onClicked={() => connect(ap)}>
                        <box spacing={4}>
                          <image iconName={createBinding(ap, "iconName")} />
                          <label label={createBinding(ap, "ssid")} />
                          <image
                            iconName="object-select-symbolic"
                            visible={createBinding(
                              wifi,
                              "activeAccessPoint",
                            )(active => active === ap)}
                          />
                        </box>
                      </button>
                    )}
                  </For>
                </box>
              </popover>
            </menubutton>
          )
        }
      </With>
    </box>
  );
};
