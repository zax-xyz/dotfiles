import { createBinding, For, This } from "ags";
import app from "ags/gtk4/app";

import twStyle from "./assets/styles.css";
import { Bar } from "./src/widget/Bar";
import style from "./style.scss";

app.start({
  css: style + twStyle,
  main() {
    const monitors = createBinding(app, "monitors");

    <For each={monitors}>
      {monitor => (
        <This this={app}>
          <Bar gdkmonitor={monitor} />
        </This>
      )}
    </For>;
  },
});
