import { Accessor, With } from "gnim";
import { toAccessor } from "../utils";

type Props = {
  transitionDuration?: number;
  enter?: string | Accessor<string>;
  exit?: string | Accessor<string>;
  show: boolean;
  css?: string | Accessor<string>;
};
export const Transition = ({
  transitionDuration,
  enter = "",
  exit = "",
  show,
  css = "",
}: Props) => {
  return (
    <With value={toAccessor(css)}>
      {css => (
        <With value={toAccessor(enter)}>
          {enter => (
            <With value={toAccessor(exit)}>
              {exit => (
                <box
                  css={`
                    ${css};
                    transition: ${transitionDuration}ms;
                    ${show ? enter : exit}
                  `}
                ></box>
              )}
            </With>
          )}
        </With>
      )}
    </With>
  );
};
