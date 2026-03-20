import { createBinding } from "ags";
import AstalBattery from "gi://AstalBattery";

import { spacing } from "../../utils";

export const Battery = () => {
  const bat = AstalBattery.get_default();

  const charging = createBinding(bat, "charging");
  const timeToFull = createBinding(bat, "timeToFull");
  const timeToEmpty = createBinding(bat, "timeToEmpty");
  const percentage = createBinding(bat, "percentage");

  const timeLeft = charging(isCharging =>
    (isCharging ? timeToFull : timeToEmpty)(t => {
      const minutes = Math.floor(t / 60);
      const hours = Math.floor(minutes / 60);

      return `${hours}h ${minutes % 60}m left`;
    }),
  );

  return (
    <box class="battery" visible={createBinding(bat, "isPresent")}>
      <image iconName={createBinding(bat, "batteryIconName")} pixelSize={14} />
      <label label={percentage.as(p => `${Math.floor(p * 100)} %`)} />
      {/* <With value={timeLeft}> */}
      {/*   {timeLeft => <label visible={percentage.as(p => p < 1)} label={timeLeft} />} */}
      {/* </With> */}
    </box>
  );
};
