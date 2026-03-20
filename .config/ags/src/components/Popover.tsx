import { Astal, Gdk, Gtk } from "ags/gtk4";
import app from "ags/gtk4/app";
import { onCleanup } from "gnim";
import { spacing } from "../utils";

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor;

type PopoverProps = Pick<
  JSX.IntrinsicElements["window"],
  | "class"
  | "name"
  | "namespace"
  | "visible"
  | "marginBottom"
  | "marginTop"
  | "marginLeft"
  | "marginRight"
  | "halign"
  | "valign"
  | "anchor"
> & {
  onClose?(self: Astal.Window): void;
  children: JSX.Element;
};

/**
 * Full screen window widget where you can space the child widget
 * using margins and alignment properties.
 *
 * NOTE: Child widgets will assume they can span across the full window width
 * this means that setting `wrap` or `ellipsize` on labels for example will not work
 * without explicitly setting its `max_width_chars` property.
 * For a workaround see Popover2.tsx
 */
export const Popover = ({
  children,
  marginBottom,
  marginTop,
  marginLeft,
  marginRight,
  halign = Gtk.Align.CENTER,
  valign = Gtk.Align.CENTER,
  onClose,
  ...props
}: PopoverProps) => {
  let win: Astal.Window;

  return (
    <window
      $={self => {
        win = self;
        const keyEventController = new Gtk.EventControllerKey();
        const clickGestureController = new Gtk.GestureClick();
        clickGestureController.connect("begin", g => {
          const event = g.get_current_event();
          if (event === null) {
            return;
          }

          const [_, _ex, _ey] = event.get_position();
          const { x, y, width, height } = self.child.get_allocation();
          const ex = _ex - spacing(8);
          const ey = _ey - spacing(8);

          const xOut = ex < x || ex > x + width;
          const yOut = ey < y || ey > y + height;

          // clicked outside
          if (xOut || yOut) {
            self.visible = false;
          }
        });

        keyEventController.connect("key-pressed", (_, e) => {
          if (e === Gdk.KEY_Escape) {
            self.visible = false;
          }
        });

        self.add_controller(keyEventController);
        self.add_controller(clickGestureController);
      }}
      namespace="ags-noanim"
      // room for shadow
      css="background-color: transparent; padding: 2rem"
      marginTop={-spacing(8)}
      keymode={Astal.Keymode.EXCLUSIVE}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      exclusivity={Astal.Exclusivity.IGNORE}
      onNotifyVisible={self => {
        if (!self.visible) {
          onClose?.(self);
        }
      }}
      application={app}
      {...props}
    >
      <box
        class="shadow-xl"
        // make sure click event does not bubble up
        onNotifyCursor={() => true}
        halign={halign}
        valign={valign}
        marginBottom={marginBottom}
        marginTop={marginTop}
        marginStart={marginLeft}
        marginEnd={marginRight}
      >
        {children}
      </box>
    </window>
  );
};
