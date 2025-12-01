import { createState, With } from "ags";
import { Astal, Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";
import GLib from "gi://GLib";

import { Popover } from "../../components/Popover";
import { spacing } from "../../utils";

export const Time = () => {
  const time = createPoll([], 1000, () => {
    const dt = GLib.DateTime.new_now_local();
    return [dt.format("%H:%M")!, dt.format("%a %d %b")!];
  });

  const [showCalendar, setShowCalendar] = createState(false);
  const [calendarMarginTop, setCalendarMarginTop] = createState(0);

  <Popover
    visible={showCalendar}
    onClose={() => setShowCalendar(false)}
    anchor={Astal.WindowAnchor.TOP}
    marginTop={calendarMarginTop}
  >
    <Gtk.Calendar />
  </Popover>;

  return (
    <box>
      <button
        class="time-btn [all:unset]"
        onClicked={self => {
          const bar = self.root.get_first_child();
          if (bar === null) {
            console.error("bar not found");
            return;
          }
          const [_, _x, _y, _width, height] = bar.get_bounds();
          setCalendarMarginTop(height + 3);
          setShowCalendar(true);
        }}
      >
        <With value={time}>
          {([date, time]) => (
            <box spacing={spacing(1)}>
              <label class="time" label={date} />
              <box valign={Gtk.Align.CENTER} class="min-w-0.75 min-h-0.75 rounded-sm bg-ctp-text" />
              <label class="time" label={time} />
            </box>
          )}
        </With>
      </button>

      {/* <With value={showCalendar}> */}
      {/*   {showCalendar => */}
      {/*     showCalendar ? ( */}
      {/*       <box */}
      {/*         css={` */}
      {/*           transition: 0.15s; */}
      {/*           opacity: ${showCalendar ? 1 : 0}; */}
      {/*           min-height: 1rem; */}
      {/*           min-width: 1px; */}
      {/*           margin-left: -1px; */}
      {/*           animation: appear-down 0.2s; */}
      {/*         `} */}
      {/*       > */}
      {/*         <popover visible={showCalendar} onClosed={() => setShowCalendar(false)}> */}
      {/*           <Gtk.Calendar /> */}
      {/*         </popover> */}
      {/*       </box> */}
      {/*     ) : null */}
      {/*   } */}
      {/* </With> */}
    </box>
  );
};
